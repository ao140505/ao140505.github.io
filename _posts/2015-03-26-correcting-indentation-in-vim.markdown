---
layout: post
title: Correcting Indentation in Vim
date: 2015-03-31
comments: true
keywords: "correcting indentation, vim, indentation"
description: "How you can quickly correct indentation in Vim"
---

Have you ever pasted code into Vim only to find that the formatting is
completely messed up?

Me too. And I used to find it really annoying, because it would take me
roughly forever to correct every line, one at a time.

Eventually, I realized that I changed indentation a lot. Like when I...

* move Sass to a place that is more or less indented
* copy CSS from Chrome into Vim
* refactor ruby code

It felt silly to spend so much time fixing indentation. I figured
there was a better way.

`=` is the key I was looking for. Once you learn how to use it, you will
never want to go back to using any other text editor.

## How do I use `=`?

Like a lot of things in Vim, you have a few choices.

## 1. Correct one line

Just press `==`.

**When to use it:** when you want to quickly correct one line.

## 2. Correct a chunk of text

Press `=`, followed by a motion (j, k, p, G, etc.)

**When to use it:** when you can think of a motion key for describing
the text that you want to indent. I use `ap` ('around
paragraph') a lot because I want to indent entire methods or chunks of
CSS with one move.

## 3. Visual

Visually select a block of text. Then, press `=`.

**When to use it:** when you want to be totally sure you've selected the
correct text before indenting it.

## The moves I use every day

These are my favorite ways to use `=`:

```
 == - correct the current line
=ap - correct the current 'paragraph'
 =G - correct to the end of the file
```

## Can I correct an entire file?

Yup, no problem. Just do `gg=G`.

## It's not working for me

This happened to me a few times when I was editing a file with a new or
weird file extension. I fixed it by checking these things:

1. check that `:set filetype?` returns the correct file type
2. check that you have an indent file for the file type in
   `~/.vim/indent/`

## What is this magic?

`=` is called a **filter**. I haven't found a great use for them other
than `=`, but you can do some crazy things like run text through shell
programs such as `sort` and `uniq`.

Check the docs with `:help filter`.

## Related Posts

* [Rename a file without leaving Vim]({% post_url 2014-11-05-rename-a-file-without-leaving-vim %})
* [Ctags in Vim]({% post_url 2012-10-15-ctags-in-vim %})
