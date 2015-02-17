---
layout: post
title: Start Your Rails App in Tmux With One Command
date: 2015-02-16
comments: true
keywords: "tmux, rails"
description: "How you can start your rails app with one command"
---

This is what happens when most people decide to sit down and work on
their rails app:

<p style="text-align:center;">
  <img src="/img/starting-a-rails-app.png" alt="starting a rails app">
</p>

It takes a lot of steps to go from want to work on a rails app to
having it up and running.

## What if you can't remember how to start the app?

Starting your rails app only goes this smoothly when
you know what you need to start and the commands
to start everything. When this is not the case, you may have to slog
through the Readme first - ugh.

## Every Rails app is a little different

**Every rails app that I've worked on is slightly different from the last**
- different background job runners, different database
servers, different ruby versions, and so forth. That means slightly
different commands are needed to start each one of them.

And while your side project is written in rails, there's a good chance
that you work on completely different types of frameworks and languages.
Remembering how to start all of these projects can quickly turn into
a nightmare.

I got tired of all of this. I searched for something that could...

* remember how to start my app so I don't have to read the Readme every
  time I start it
* start everything I needed with **one command**
* handle **any type of app** - sinatra, rails, jekyll, Angular, etc.

## Enter Tmuxinator

Let me show you how I start my projects:

<iframe src="//fast.wistia.net/embed/iframe/iai2q400qk?videoFoam=true" allowtransparency="true" frameborder="0" scrolling="no" class="wistia_embed" name="wistia_embed" allowfullscreen mozallowfullscreen webkitallowfullscreen oallowfullscreen msallowfullscreen width="1280" height="748"></iframe><script src="//fast.wistia.net/assets/external/E-v1.js"></script>

Ready to get started with Tmuxinator? Check out my
[earlier post on Tmuxinator]({% post_url 2013-02-12-using-tmux-and-tmuxinator %})
for the details.

{% include newsletter-cta.html bottomtext="Sign up for my newsletter to hear about more tips like this!" %}
