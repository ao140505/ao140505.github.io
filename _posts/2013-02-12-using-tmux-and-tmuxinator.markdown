---
layout: post
title: "Using Tmux and Tmuxinator"
date: 2013-02-12 08:20
comments: true
published: true
keywords: "ctags, vim, productivity, ruby"
---

I have been using tmux for the past few months and it has become one of
my favorite programming tools. I love the window management for keeping
my work organized and as automated as possible.

Tmux is referred to as a terminal multiplexer and is similar to GNU Screen.
Basically, a terminal multiplexer enables you to run multiple terminal sessions
within one window.

This is what a simple session with two windows looks like for me:
![tmux example](/img/ex-tmux.png)

## Why Use Tmux?

One reason I really like tmux is because it helps you keep your
terminals very organized.  I use iTerm2 and work on web apps during the
day. Typically, I need to run two apps at the same time - a client and a
server. I also use command line vim for text editing. So, that means
without tmux, I need a minimum of four terminal tabs in order to work
on these two projects at the same time. That's already a lot of tabs to
keep track of.

Without tmux, I spend a lot of time looking for things. I end up looking
for things rather than just knowing where they are. My four tabs quickly
balloon to seven tabs as I started up rails consoles, ssh to servers, edit
my dotfiles and so forth. Then, I have to tab through them constantly to
find what I am looking for.

When I use tmux, each project is contained in
a tmux session and everything ends up being much easier to find. I
always have vim in the first window and my server running in the second
window. Then, I can add windows and splits as needed. I spend less time
looking for things and can keep focused on more interesting problems.

## Tmuxinator

Tmuxinator makes tmux even more awesome because it allows you to
set up configurable sessions. For example, a minimal tmux session for me
involves two windows - one for vim and another for running my rails
server (pictured above). Without tmuxinator, it's about a four step process
to get that set up to start work on a project that has to be repeated
every time. With tmuxinator, it's a one liner - I run `mux blog`
to start all of that instantly.

## Getting Started With Tmuxinator

This is all it takes to get started (see the tmuxinator
[readme](https://github.com/aziz/tmuxinator) for the latest instructions):

```bash
$ gem install tmuxinator
$ mux new some_project     # I like the 'mux' alias
$ mux open some_project    # to open the config in $EDITOR
```

Edit the config as needed:

```ruby
# ~/.tmuxinator/some_project.yml

project_name: some_project
project_root: ~/code/some_project
tabs:
  - vim: vim
  - preview: bundle exec rake preview
```

Start the tmux session:
```bash
$ mux some_project
```

## Other Cool Features of Tmux

Tmux has a plethora of features I don't have time to go into. Here are
some of my favorites:

* low-bandwidth pair programming
* easily detach and attach to different sessions
* alerts to changes in other windows
* vim-like key bindings - keep your fingers on home row

## Note

It seems like tmuxinator is no longer being maintained.
That hasn't been a problem for me, but it could
eventually cause issues.

## Further Reading
  * [tmux crash course](http://robots.thoughtbot.com/post/2641409235/a-tmux-crash-course) from thoughtbot
  * [tmux: producive mouse-free development](http://pragprog.com/book/bhtmux/tmux) - excellent intro
    to tmux
  * [tmuxinator](https://github.com/aziz/tmuxinator) on github
  * [wemux](https://github.com/zolrath/wemux) - pairing with tmux
  * [tmux vs. screen](http://www.youtube.com/watch?v=QxTse5Elq8s)
    (youtube video)
