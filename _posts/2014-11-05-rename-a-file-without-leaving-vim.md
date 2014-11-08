---
layout: post
title: Rename a file without leaving Vim
date: 2014-11-05
comments: false
keywords: "vim, rename file"
description: "how to rename the current file in vim"
---

Renaming files when you are coding can be a time consuming and annoying
chore. You just want to get it over with quickly so that
you can get back to your real work.

This is how I used to do it:

```
1. suspend vim to get to the terminal
2. mv lib/old_file.txt lib/new_file.txt
3. resume vim
4. notice warning about file no longer existing
5. open the new file
```

## A Faster Way

I found this handy vim function in Gary Bernhardt's
[.vimrc](https://github.com/garybernhardt/dotfiles/blob/master/.vimrc):

```vim
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>
```

Once you have that in your `.vimrc`, renaming a file becomes much simpler.
You **don't even have to leave vim**:

```
1. <leader>r
2. correct filename
3. press enter
```

Congrats. You just sharpened your tools and saved yourself a few seconds per day.

{% include newsletter-cta.html bottomtext="Sign up for my newsletter to hear about more tips like this!" %}
