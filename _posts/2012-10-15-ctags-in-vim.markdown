---
layout: post
title: "Ctags in Vim"
date: 2012-10-15 21:52
comments: true
keywords: "ctags, vim, productivity, ruby"
---

Ctags help you navigate large or unfamiliar code bases.  For example, they
help you quickly jump to method definitions. Prior to using ctags,
I would do the following:

1. look at the method being called e.g. 'some_object.some_method'
2. do a project-wide search for 'some_method' to determine which file to open
3. open that file
4. if the file is large, search for the method again

I learned to do this relatively quickly and really got used to it. Ctags
make this look ridiculous.

With ctags, I simply put my cursor on the method and
press `tt`(custom vim binding) and that immediately opens
up the correct file on the correct line.

This post covers how to get started with ctags and how to customize them
a bit. Note: I'm going to focus on how to use ctags on a mac with vim.
Other operating systems and editors should require similar steps.

## Basics

If you have [homebrew](http://mxcl.github.com/homebrew/), installation is simple:

```bash
brew install ctags
```

In your console, navigate to a project and run this:

```bash
ctags -R --exclude=.git
```

That should create a tags file in the root of the project. Now, find a method call
within the project and press `Ctrl+]` to jump to the first matching
tag. Then, press `Ctrl+t` to go back.

If there are multiple matching tags you can go through them with `:tnext`
and `:tprevious`.

## Advanced Usage

These are some optimizations that make working with ctags much
more streamlined for me.

### Customize Vim

I find the default ctag commands a bit cumbersome to type so I use the
following mappings in my .vimrc (including a mapping to regenerate the
ctags when needed):

```bash
# manually, regenerate ctags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

# main mapping, go to first matching tag
map tt <c-]>

# move forward and back through matching tags
map <c-b> :tprevious<CR>
map <c-n> :tnext<CR>
```

### Automatically Generate Ctags with Git Hooks

Another thing you might want to avoid is having to manually update your
ctags when the code changes over time.

Fortunately, there is a way to automate the generation of ctags with git
hooks and Tim Pope outlines it [in this blog post](http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html).
The gist of it is that you setup git hooks to automatically regenerate
ctags in a background process after you do stuff like a `git pull,
merge, commit, or rebase`.

## Further Reading

* `:help tags` in vim
* `man ctags`
* [generating ctags for gems in a project](http://heim.no/VIM/2012/04/19/generate-ctags-for-all-bundled-gems-in-a-ruby-project/)
* [http://ctags.sourceforge.net/index.html](http://ctags.sourceforge.net/index.html)
