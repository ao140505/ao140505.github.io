---
layout: post
title: Shortcuts for navigating nested associations
date: 2015-06-22
comments: true
keywords: "Active Record, associations, nested associations"
description: "Shortcuts for navigating nested associations using Active Record"
---

As your rails app gets more complex you will end up with models that are
related to each other but with one or more models between them.

Say you have the following models:

```ruby
class Order
  has_many :line_items
end

class LineItem
  has_one :product
end

class Product
  belongs_to :line_item
end
```

In this case, an `Order` can have many products, but you have to go through
line items to get to them.

So, when you have an order, how do you get its products?

At first, you might write something like this:

```ruby
 order.line_items.map(&:product)
```

This might seem ok at first, until you realize there's an N+1 problem
here. Getting the products this way will run one SQL query for every
product in the order:

```
LineItem Load (0.2ms)  SELECT "line_items".* FROM "line_items" WHERE "line_items"."order_id" = ?  [["order_id", 5]]
Product Load (0.1ms)  SELECT  "products".* FROM "products" WHERE "products"."id" = ? LIMIT 1  [["id", 7]]
Product Load (0.1ms)  SELECT  "products".* FROM "products" WHERE "products"."id" = ? LIMIT 1  [["id", 8]]
```

Depending on your SQL skill level, you might realize there's a way to
get the products with one query; it's just unclear how to do this with
Active Record.

## The Solution

It turns out there is an elegant way to solve this with active record
associations. In the rails guide, they refer to this as a 'short cut'
between models. All we need to do is add this one line to the `Order` class:

```ruby
class Order
  has_many :line_items
  has_many :products, through: :line_items # new code
end
```

With this 'short cut' in place we can get from an order to products with
one method call:

```ruby
order.products
```

And that loads the products with one SQL query:

```
Product Load (0.1ms)  SELECT "products".* FROM "products"
INNER JOIN "line_items" ON "products"."id" = "line_items"."product_id"
WHERE "line_items"."order_id" = ?  [["order_id", 5]]
```

Another **really important difference** between this code and the `map` solution is
that `order.products` does not load the records right away - instead, it
returns an
[ActiveRecord\_Associations\_CollectionProxy](http://edgeapi.rubyonrails.org/classes/ActiveRecord/Associations/CollectionProxy.html).
The `map` version returns an array.

What the heck is a collection proxy and why is that a good thing?

Basically, the proxy is something that allows you further refine the SQL
by chaining method calls onto it.

For example, say you only want the products for the order with a price
greater than a certain amount:

```ruby
order.products.where('price > 300')
```

Powerful stuff.

## But wait, there's more

Let's introduce one more model into this example to make it more
realistic. Say, we have a `User` model like this:

```ruby
class User
  has_many :orders
end
```

Now, how can we get a list of all of the products a user has ordered
before?

This is the same kind of problem. We know they are related to
each other, but the relationship spans several models.

It turns out, this is trivial with Active Record. We can just add
another 'short cut' with `has_many through` in the user class:

```ruby
class User
  has_many :products, through: :orders
end

# then, we can do this
some_user.products => it works!
```

## Be careful though

There is one thing to look out for  with this last example though. What
if a user purchased the same product more than once?

Calling `user.products` will return *duplicate products*.

There are a few ways to work around this:

1) Remember to call 'distinct' wherever you need the products:

```ruby
some_user.products.distinct
```

2) Change our has_many through declaration to always return distinct products:

```ruby
class User
  has_many :products, -> { distinct }, through: :orders
end
```

So, depending on your schema and situation you may need to look out for
duplicate records being returned.

## Want to try it out?

I set up a [demo rails
app](https://github.com/aokolish/active-record-shortcuts) on GitHub with
these exact models. If you want to see firsthand how this works, clone
the repo and fire up a console to try out a few queries.

{% include newsletter-cta.html toptext="Enjoyed this post?" bottomtext="Get my best stuff, delivered for free." %}
