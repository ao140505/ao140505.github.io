---
layout: post
title: "@font-face with the Asset Pipeline"
date: 2011-12-24 15:56
comments: true
keywords: "rails, asset, pipeline, font-face, @font-face, fonts, custom fonts"
---

## TL;DR

If you are new to the asset pipeline in rails, using custom fonts can be
a bit confusing. This is how I recommend getting started:

1. add fonts in app/assets/fonts/
2. add the fonts folder to the asset path
3. use the sass-rails helpers to reference the font files
4. use the fontspring @font-face syntax

## Getting Started

To get started, you need a custom font to use in your rails app.
Personally, I was starting out with an icon font - [Signify-lite](http://medialoot.com/item/signify-free-icon-font/). If you plan to support all devices, you will need four different font files: 

1. embedded open type (.eot)
2. woff (.woff)
3. truetype (.ttf)
4. scalable vector graphics (.svg)

If you are missing one or more of these, fontsquirrel.com has a [free generator](http://www.fontsquirrel.com/fontface/generator) that can create the other font files based off of the file that are starting out with.

## Add the Fonts Folder to the Asset Path

You can certainly put your fonts wherever you like, but a 'fonts' folder
right under app/assets makes the most sense to me. With the asset
pipeline, you have to do a bit of work if you want to do that; you
have to add that folder to the 'asset path'. In this case, you just add
this to your config/application.rb:

``` ruby
# add app/assets/fonts to the asset path
config.assets.paths << Rails.root.join("app", "assets", "fonts")
```

Restart your server, and that will take effect.

## @font-face declaration

The best cross-browser font-face syntax appears to be the [font spring](http://www.fontspring.com/blog/the-new-bulletproof-font-face-syntax) syntax:

```
@font-face {
	font-family: 'MyFontFamily';
	src: url('myfont-webfont.eot?#iefix') format('embedded-opentype'), 
	     url('myfont-webfont.woff') format('woff'), 
	     url('myfont-webfont.ttf')  format('truetype'),
	     url('myfont-webfont.svg#svgFontName') format('svg');
}
```

If you are already familiar with the asset pipeline, you know
that you cannot reference your font like this:

``` css
... url('/assets/fonts/myfont-webfont.ttf')
```

Instead, it is recommended that you add '.erb' to your filename and use
the asset_path helper like this:

``` css
... url('<%= asset_path 'myfont-webfont.ttf' %>')
```

Frankly, that seems kind of shitty to me. First of all, it requires you to change
the file extension; it's a bit confusing (all of your Sass files will
end with .erb) and you'll probably have to go
out of your way to tell your editor that a .scss.erb file is
actually Sass. Secondly, that syntax doesn't look like css or Sass. 
So, I use the sass-rails helpers instead and keep
my files extensions as scss. The final syntax looks like this:

``` css
@font-face {
	font-family: 'MyFont';
	src: url(font-path('myfont-webfont.eot') + "?#iefix") format('embedded-opentype'),
	     url(font-path('myfont-webfont.woff')) format('woff'), 
	     url(font-path('myfont-webfont.ttf'))  format('truetype'),
	     url(font-path('myfont-webfont.svg') + "#MyFont") format('svg');
}
```

Sass supports string concatenation, so I use that to pull off the
syntax suggested for the eot and svg font files.

## Conclusion

I found it to be a bit of work to get
all this working. Hopefully, this helps you get your custom fonts 
working quicker than I did. Feel free to let me know if you run into any
issuse with this.

If you have some flexibility around
which fonts you are going to use, I suggest you check out [Google's web fonts](http://www.google.com/webfonts); it's an even easier way to start using new web fonts.
