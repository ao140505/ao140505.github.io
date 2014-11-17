---
layout: post
title: 8 Reasons to not use Ember.js for your next project
date: 2014-11-16
comments: true
keywords: "ember.js, ember, rails"
description: "8 Reasons to not use Ember.js for your next project"
---

I was very fortunate a few months ago to have the opportunity to learn
and use Ember.js to build a dashboard within an existing rails
application.

The dashboard felt like a standalone app within our main site
and we wanted it to feel very snappy. We decided to give Ember a
shot for building it.

I worked on this with a co-worker and it took us about
3 months to complete our project.

This post describes a few of the reasons I would strongly hesitate to
reach for this type of framework again. If you are considering investing
time into learning a client-side MVC framework, I suggest you read this
to see what problems you might run into.

## 1. Silent errors

One thing that really frustrated me about developing in Ember is all of
the silent failures we encountered. We had to be very vigilant not to
check in code that caused these silent failures.

For example, take this mustache template that has a typo in it:

```html
<p>{{ "{{user.first_nam"}}}}</p>
```

This code is wrong. Yet, it doesn't even cause a **JavaScript error**.

An ERB or Haml version of this same template would fail loudly
with a `NoMethodError`; the code would never make it to production.

> Silent failures do not make my job easier

## 2. Deep linking - unreliable

Ember's router seemed like a great feature to me. I liked that every
page of our app would have a URL - just like a server-side app.
As our app became more complex though, deep linking started
**randomly not working**.

For example, consider these Ember routes:

```
/users/
/users/15/
/users/15/photos/
```

We ran into situations where this would work:

```
1. load app and end up on /users/
2. click on a user - /users/15
3. click on photos - /users/15/photos/
4. the app works
```

Yet, visiting the same route directly **would not work**:

```
1. visit /users/15/photos/ directly
2. the app breaks
```

These types of failures where inconsistent and very confusing. In about
50% of the cases, visiting a URL directly would work. The rest of the time, it
would not.

This was extremely frustrating, and lead to many confusing debugging
sessions. And we now had **two scenarios to test
for every route in the app**. 1) Visiting the route from within the app.
2) visiting an ember route directly.

> I have never seen this issue with a normal rails app

## 3. Few libraries

Our app required pagination. At the time we wrote our Ember app, I found
no Ember add-ons that could help us write pagination.

The only thing I could find was a script that you could get you started
with pagination in Ember. It didn't work with our version of Ember and
it had to be extended in many ways just to create very basic pagination.
Consequently, I had to spend a lot of time writing pagination code.
That work was surprisingly time-consuming and really extended the project
timeline.

> I felt that I was re-inventing the wheel, and poorly because I had a
> deadline to hit.

## 4. Few code examples / resources

This is not surprising given that Ember is a new framework. But, we
lost a lot of time working with issues where there were no blog posts or
stack overflow posts to be found. We were totally on our own
to figure these issues out and quite often the solutions did not even
make sense to us.

## 5. Slower development

Our development speed was about 1/3 of what it
would have been with normal rails development. We
spent most of our time trying to learn the framework or being really
confused as to why our code was not working. After
three months, I still didn't feel that I understood Ember.

## 6. Added layers and complexity

Rails developers and critics often talk about rails *magic*.
Rails is powerful because it handles a lot of the complex and
unglamorous work from you. Ember aims to do the same, but somehow falls short.

Where Rails *magic* enables you to be very productive. Ember *magic*
seemed to make us less productive. Topics as simple as **how links work**
became things that we gave up trying to understand.

Additionally, using Ember really increased the layers in our
stack. Consider this diagram:

![ember layers](/img/ember-layers.png)

All of that complexity increases development time, increases the learning curve,
and increases confusion. It became harder for an individual to
to develop a feature on their own.

> Layers and complexity - not things I seek when choosing
> my tools

## 7. It restricted our design

There were several instances where using Ember
restricted our website's design. Had we been using rails and vanilla
JavaScript, we could have implemented what we wanted. Instead, we had to
make design compromises to fit our ideas into what was possible with the
framework.

> Sticking with the raw materials - HTML, CSS, and JavaScript is
> much less limiting on your design than using a complex framework

## Conclusion

I wish I had known more about the problems I would face before diving into Ember.
Had I known about them, I would not have chosen Ember.

I think we've all seen enough ToDo apps demonstrating how "great" these
frameworks are.  It's time for people to start sharing their
experiences using these frameworks to build real applications.

If your priorities include shipping features quickly, developer
happiness, maintainable code, and design flexibility, skip
the hype and stick with tools that are proven to work.

## Further Reading

* [Client-side MVC is not a silver bullet](http://mir.aculo.us/2013/02/26/client-side-mvc-is-not-a-silver-bullet/)
* [Rebuilding the Shopify Admin: Improving Developer Productivity by Deleting 28,000 lines of JavaScript](http://www.shopify.com/technology/15646068-rebuilding-the-shopify-admin-improving-developer-productivity-by-deleting-28-000-lines-of-javascript)
