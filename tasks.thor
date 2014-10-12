class Post < Thor
  include Thor::Actions

  desc 'generate', 'generates a new post'
  def generate(title)
    date = Time.new.strftime('%Y-%m-%d')
    slug = title.downcase.strip.gsub(' ', '-')
    final_title = "#{date}-#{slug}.markdown"
    filename = File.join('_posts/', final_title)

    create_file filename do
      <<-contents.gsub(/^\s+/, '')
        ---
        layout: post
        title: #{title}
        date: #{date}
        comments: true
        keywords: "foo, bar, baz"
        description: "<put description here>"
        ---
      contents
    end
  end
end

require 'jekyll'
require 'tmpdir'
require 'fileutils'
require 'shellwords'

class Blog < Thor
  namespace :default

  desc 'publish',  'generate and publish blog to gh-pages'
  def publish
    generate

    Dir.mktmpdir do |tmp|
      FileUtils.cp_r "_site/.", tmp
      Dir.chdir tmp
      system "git init"
      system "git add ."
      message = "Site updated at #{Time.now.utc}"
      system "git commit -m #{Shellwords.shellescape(message)}"
      system "git remote add origin git@github.com:ao140505/ao140505.github.io.git"
      system "git push origin master --force"
    end
  end

  private

  def generate
    Jekyll::Site.new(Jekyll.configuration({
      "source"      => ".",
      "destination" => "_site"
    })).process
  end
end
