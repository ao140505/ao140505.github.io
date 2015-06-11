---
layout: post
title: How much SQL do you need to know to land a Rails job?
date: 2015-06-10
comments: true
keywords: "SQL, Ruby on Rails, Rails, Rails interview"
description: "The SQL you need to know to land a Rails job"
---

Interviewing for Rails jobs can be really tough. You have to know a lot
of different things to be a good rails developer:

* Ruby
* Rails
* Javascript
* CSS
* HTML
* deployment
* Git
* SQL
* the list goes on...

You might not need to know *all* of that if you specialize in
front-end or back-end only. But, you will need to know a good
chunk of it.

Over the last few years, I've interviewed for roughly 30 rails jobs and
have been rejected for every reason imaginable.

I bombed a ton of interviews by being bad at whiteboarding
and CS questions (I [wrote about that]({% post_url 2013-05-11-finding-a-job %})
previously), but I also struggled with SQL questions in some of them.

## Do you need to be a DBA to get an offer?

When you head into a rails job interview, it's unlikely that SQL is
going to be the focus of the interview because...

* rails devs don't often need to write queries by hand because they have
  Active Record
* SQL is fairly complex and cumbersome to write
* a solid rails developer needs to know a variety of other things that
  they may ask you about

With that said, there is a good chance that you'll be asked a few
SQL questions.

## The SQL you need to know

So, you don't need to be a DBA, but you will need to know some SQL. The
amount you need to know will vary based on your experience, the
position, and the interviewer.

Here are the most common questions I've been asked when interviewing for
rails jobs:

1. What is a join? What types of joins are there?
1. What is the difference between an inner join and a left join?
1. What is an index? When should you use one?
1. What is a join table? When would you use one?
1. Which Active Record association should you use in \[X\] situation?
1. Given \[X\] association (has\_one, has\_many, belongs\_to, etc.),
   what database schema is needed for this association to work?

Once you can answer these, SQL questions are unlikely to block you from
getting an offer at your next interview.

## How you can learn this stuff

I learned all of this in bits and pieces and by fumbling around with it
for years.

If you want to learn SQL more quickly than I did, I suggest you do the
following:

* pick up a good book on SQL (when I was a .NET
  developer, I read [this
  one](http://www.amazon.com/gp/product/1890774510?psc=1&redirect=true&ref_=oh_aui_search_detailpage) -
  it was boring, but helpful)
* learn about the SQL that Active Record is generating for you in your
  current code (look into the `to_sql` method, and [logging SQL to the
  console](http://stackoverflow.com/questions/2936000/how-to-show-sql-queries-run-in-the-rails-console)
  as you run and experiment with queries)
* ask your friends and co-workers to explain concepts you don't
  understand
* finally, search online - you can find good info online once you know what
  you need to know

{% include newsletter-cta.html toptext="Enjoyed this post?" bottomtext="Get my best stuff, delivered for free." %}
