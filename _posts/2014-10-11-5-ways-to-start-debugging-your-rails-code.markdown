---
layout: post
title: 5 ways to start debugging your rails code
date: 2014-10-11
comments: true
keywords: "debugging rails, debug rails, debugging tips"
description: "5 ways to start debugging your rails code"
---

It can be really frustrating if you don't know how to debug your code.
Maybe, you have an idea about what the problem is, but you don't know
how to look into it.

Instead of doing this:

# (╯°□°）╯︵ ┻━┻

Use one of these techniques.

## 1. set a breakpoint

Let's say you have some code that looks like this:


```ruby
def create
  @user = User.new(user_params)

  if @user.save
    # do something
  else
    # do something else
  end
end
```

And you think that `@user.save` is not saving the @user. My favorite way to
look into this is to use [pry](http://pryrepl.org/). Install pry
and insert a `binding.pry` into your code like so:

```ruby
def create
  @user = User.new(user_params)

  binding.pry
  if @user.save
  #...
end
```

Submit the form or request again and execution will stop on that
line. At that point, you can print useful stuff out. You might
want to see what `@user.valid?` returns. Or, you could run `@user.save`
to verify that it is returning `false`.

Pry is the tool I reach for the most. Check it out if you are not
already using it.

## 2. print stuff out

You can also figure out a lot of the same things by adding `puts`
statements to your code.

For example, instead of using pry in the example above. Put this into
your code:

```ruby
puts "user valid: #{@user.valid?}"
@user.save
# ...
```

Then, go check your logs to see if your `@user` is valid.

## 3. read the exception output

This might sound crazy, but often times people do not read or
think about exceptions.

```
`NoMethodError (undefined method 'first_name' for nil:NilClass)`

Backtrace:
app/views/users/show.html.erb:37
# ...
```

Don't do this -  (ノಠ益ಠ)ノ彡┻━┻

Instead, do this:

1. think "gee, something is nil that I didn't expect to be nil."
2. open `app/views/users/show.html.erb` in your editor and go to
   line 37
3. find out what is nil (`@user` or something similar)
3. work backwords to figure out why that is happening

## 4. check network requests

Say, you have a feature that is using ajax and it is not working. You
can use the network tab to see what is going on with the ajax request.

Here is what that looks like in Google Chrome:

![network tab](/img/network_tab.png)

You can get some good info just from the status code. If you see a 404,
you might have a routes issue. If you see a 500, check the logs for an
exception. If you see 422, try debugging your controller action.

## 5. check the logs for exceptions

This is a nice low-tech way to get feedback from your app. Try clearing
your logs `rake log:clear`. Load the page or submit the form in
question. Then, look at your development.log file. You might find that
an exception occured in there.

1. Clear your logs `rake log:clear`.
1. Load the page or submit the form in question.
1. Look through your development.log file.

You might find an exception in there. This is also a useful technique
for finding n+1 and other sql problems.

{% include newsletter-cta.html %}
