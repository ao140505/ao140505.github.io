---
layout: post
title: "Running Spinach Features with Zeus"
date: 2013-02-10 16:13
comments: true
keywords: "zeus, spinach, integration testing"
---

If you haven't tried [zeus](https://github.com/burke/zeus) yet,
you are missing out on some free speed.  It is similar to spork
but aims to be language agnostic. The main thing I find exciting
about it is that it can be used to do things other than
run tests such as loading consoles and running generators.

I like to write my integration tests with [spinach](https://github.com/codegram/spinach),
and this does not work out of the box with zeus.
This post outlines how to get them
working together - it's pretty simple.

<!-- more -->

## What You Have to Do

Run `zeus init` to generates two zeus config files -
custom_plan.rb and zeus.json.

Fill in custom_plan.rb with the following code:

```ruby
require 'zeus/rails'

class CustomPlan < Zeus::Rails

  def spinach_environment
    require 'spinach'
  end

  def spinach
    spinach_main = Spinach::Cli.new(ARGV.dup)
    exit spinach_main.run
  end

end

Zeus.plan = CustomPlan.new
```

Replace cucumber with spinach in zeus.json so that zeus knows what to
run on startup:

```ruby
{
  "command": "ruby -rubygems -r./custom_plan -eZeus.go",

  "plan": {
    "boot": {
      "default_bundle": {
        "development_environment": {
          "prerake": {"rake": []},
          "runner": ["r"],
          "console": ["c"],
          "server": ["s"],
          "generate": ["g"],
          "destroy": ["d"],
          "dbconsole": []
        },
        "test_environment": {
          "spinach_environment": {"spinach": []},
          "test_helper": {"test": ["rspec", "testrb"]}
        }
      }
    }
  }
```

## Dependencies Used

Both spinach and zeus are fairly new so this solution may not work with
future versions of them. This works with:

* zeus version 0.13.2
* spinach 0.7.0
* spinach-rails 0.1.8 (for a rails app)

## Useful Resources:

* The [zeus](https://github.com/burke/zeus) repo on github
* [spinach](https://github.com/codegram/spinach) on github

