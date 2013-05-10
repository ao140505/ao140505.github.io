---
layout: post
title: "Testing Hover Events with Capybara"
date: 2012-01-22 22:06
comments: true
keywords: "rails, testing, capybara, hover event, trigger"
---

Recently, I needed to write an integration test that involved hovering
on elements. It was a bit painful to figure out, but the solution is simple.
There are three things you need to know:

1. You need to use capybara-webkit as you javascript driver
2. You have to trigger the 'mouseover' event
3. This solution isn't well documented

When I started trying to figure out how to hover on elements in my
tests, I only found one working solution and it involved triggering
events via jQuery like this:

``` ruby
page.execute_script('$("#element").trigger("mouseenter")')
```

I was happy that it worked, but having to use to use jQuery in the
middle of a spec felt like a hack. It turns out, the solution is pretty simple.

First, you need to use [capybara-webkit](https://github.com/thoughtbot/capybara-webkit)
in order to go with this solution. 
Add it to your Gemfile with `gem "capybara-webkit"` and run `bundle` 
to install the gem. Then, you need to add a line to your spec_helper file to tell 
rspec to use that driver for your tests involving js (default is
selenium):

``` ruby
RSpec.configure do |config|
  # ...
  Capybara.javascript_driver = :webkit
end
```

Once you are using capybara-webkit, you can trigger events on elements
such as a mouseover event:

``` ruby
page.find('#element').trigger(:mouseover)
```

This code looks so similar to the jQuery-based solution that I was
surprised that I did not figure this out quicker. What tripped me
up though was the specific event that I was triggering.
Initially, I was triggering the mouseenter event. When you do that, you
get no errors but it doesn't seem to do anything. I did some
experimenting and it seems that no errors are raised when you trigger an
unsupported event (such as a made up one). Anyhow, hovering on elements
turns out to be pretty simple.
