module Jekyll
  module ContentFilter
    def raw_content(input)
      /<div class="post-content">(?<content>[\s\S]*?)<\/div>\s*/ =~ input
      return (content.nil?) ? input : content
    end

    def condense_spaces(input)
      input.gsub(/\s{2,}/, ' ')
    end
  end
end

Liquid::Template.register_filter(Jekyll::ContentFilter)
