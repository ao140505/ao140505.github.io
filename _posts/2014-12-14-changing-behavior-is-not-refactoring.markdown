---
layout: post
title: Changing Behavior is not Refactoring
date: 2014-12-14
comments: true
keywords: "refactoring, testing"
description: "A quick story about what refactoring is not."
---

I recently inherited a new rails app with a broken build. In fact,
**20% of the tests for this app were failing**.

If fixing the build *sucks*, fixing someone else's build sucks even more.

## Smelly Code

In the process of fixing the build, I
read a decent amount of code that seemed smelly to me. One
failing test caused me to uncover a line of code that seemed extra odd:

```ruby
SomeClass.new(params.except(:foo, :bar, :baz))
```

I thought it would be better to do this:

```ruby
SomeClass.new(params.select(:foo))
```

I thought this was a nice improvement because the old code
was creating a *gigantic* hash with about 20 keys in it and passing it on.
Meanwhile, `SomeClass` appeared to only use one key from the
hash.

Clearly, that was innefficient and confusing. So, I committed my **small
refactoring** to my build fix branch.

## Green Build

Once the build was green, I deployed the app to production (including
my one line improvement). The rest of the day was quiet and everything seemed fine.

24 hours later, I got a *nasty surprise* in the middle of my day off -
my one line change had actually broken the site's **most critical feature**!

![ya blew it](/img/ya-blew-it.png)

## This is not refactoring

I thought my one line change was harmless, but it broke the site for
users and messed up my Saturday. What went wrong here?

In hindsight, I was really fixing a defect - I knew I was changing the behavior
of the code and that there was some risk that it could have unintended
consequences.

## How you can avoid this

Recognize that bug fixing and refactoring are two distinctly different activities.

**Changing the behavior of the code is not refactoring!**

Additionally, recognize that refactoring is going to be risky until
you have certain things in place such as:

* familiarity with the business you work for
* passing tests
* decent test coverage
* integration tests
