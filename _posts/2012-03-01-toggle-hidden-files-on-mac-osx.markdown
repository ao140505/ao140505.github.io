---
layout: post
title: "Toggle Hidden Files on Mac OSX"
date: 2012-03-01 19:33
comments: true
---

When I started doing development work on the Mac, I found it odd
that there was no easy way to toggle the visibility of hidden files.
Windows has had a way to do this through the GUI for years. Typically,
if you want to see hidden files on the Mac, you run something
like this on the command line:

```bash
defaults write com.apple.finder AppleShowAllFiles -boolean TRUE
killall Finder
```

And to hide them again you would run:

```bash
defaults write com.apple.finder AppleShowAllFiles -boolean FALSE
killall Finder
```

If you find yourself wanting to see hidden files in the Finder, you may not have the
terminal running. Plus, when I need to see hidden files,
switching to the terminal to do this can be a disrupting
change of context.

With that in mind, let's come up with a way to toggle these two states
while you are using the finder. I think it would be pretty slick if you
could right-click while using the finder and select something like
'Toggle Hidden' to pull this off. Automator, which comes with Mac OS X,
makes this really simple.

Open Automator and create a new Service. At the top of the workflow,
change the drop downs such that they read 'Service receives selected
files or folders in Finder ...'. Find 'Run Shell Script' and
drag that on to your workflow. Paste the following code (courtesy of
[Mack Corl](http://www.linkedin.com/pub/mack-corl/5/1a7/5b6) ) into that
script:

```bash
state=`defaults read com.apple.finder AppleShowAllFiles`;
newstate='TRUE';
if [ $state -eq 1 ];
then
    newstate='FALSE';
fi
`defaults write com.apple.finder AppleShowAllFiles -boolean $newstate; killall Finder`
```

This code simply determines whether or not hidden files are visible
and then sets them to the opposite state. Unfortunately, it also has to
kill all of the finder windows in order for them to reflect that change (it can be a
bit jarring/unexpected). Save this Service and give it a name such as
'Toggle Hidden' Now, open the finder and right-click a file or folder -
you should see your service in the context-menu and be able to test it
out.

Caveat: you must click on a file or folder in order for this service to show up in
the context menu. What do you think? Useful?
