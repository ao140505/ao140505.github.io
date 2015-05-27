---
layout: post
title: How to simplify Active Record scopes that reference other models
date: 2015-05-26
comments: true
keywords: "active record, scopes, sql fragments"
description: "How to simplify Active Record scopes that reference other models"
---

Active Record scopes are a great way to introduce domain terms into
your code without repeating queries all over the place.

What happens when you want to reuse a scope from one model in another?

Let's go through an example.

Say we have two models: `Customer` and `Device`. And a customer `has_one
:device`.

Within `Device`, I've written a scope to select devices that have
been shipped. It looks like this:

```ruby
class Device < ActiveRecord::Base
  scope :shipped, -> {
    where.not(shipped_at: nil)
  }
end
```

Later on, you want to add a scope to `Customer` to select all of
the customers with a shipped device.

Here's how I would normally write that:

```ruby
class Customer < ActiveRecord::Base
  scope :with_shipped_device, -> {
    joins(:device).where.not(device: {shipped_at: nil})
  end
end
```

And here's the SQL this produces:

```
SELECT `customers`.* FROM `customers`
INNER JOIN `devices` ON `devices`.`customer_id` = `customers`.`id`
WHERE (`devices`.`shipped_at` IS NOT NULL)
```

A few things bug me about this code:

1. The implementation of both scopes is almost identical
1. I'm not getting to re-use my scope on the `Device` model
1. Instead of using my domain terms, I'm pretty much writing SQL

## Enter Relation#merge

It turns out, there is a way to reduce this type of duplication. You can
call `merge` on any Active Record relation to merge in other scopes -
and it works across models.

So, the scope on `Customer` can be rewritten like so:

```ruby
class Customer < ActiveRecord::Base
  scope :with_shipped_device, -> {
    joins(:device).merge(Device.shipped)
  }
end
```

This produces the exact same SQL query shown above.

I like this code better because...

* it's shorter
* the query for selecting shipped devices is in one place
* it's easier to reason about; a customer with a shipped device is a
  just that - a customer with a shipped device

Check out `merge` to see if it helps you improve your scopes.

{% include newsletter-cta.html toptext="Enjoyed this post?" bottomtext="Get my best stuff, delivered for free." %}
