---
title: Sample post
date:     2018-01-19 00:16:33 CST
last_mod: 2018-01-20 16:27:51 CST
layout: post
draft: true
comments: true

description: >
    This is a really interesting post on how posts will be laid out. The layout of posts in blogs is very important, as it is the key to keeping the reader’s attention. It’s about presentation, not content.
excerpt: >
    Apparently, excerpts have to be _super_ short.
scripts:
    -
        async: true
        src: "https://platform.twitter.com/widgets.js"
image:
    src: "/assets/cherry_blossom.jpg"
    alt: "Cherry blossom"
    color: "#53cbbf"
---

# Heading level 1

Sample paragraph text. Here’s a [link to the homepage](/). Here’s some **bold,** *italic,* and ***bold and italic*** text.

<button class="flat-btn">Button lol</button>
<button class="flat-btn large">Big Button lol</button>

{% highlight html %}
<!doctype html>
<html class="no-js" lang="en-US">
    <head>
        <meta charset="utf-8">
        <title>Page Title</title>
        <meta name="viewport" content="width=device-width">
        <meta name="theme-color" content="#448aff">
        <style media="screen">
            :root, html, body {font-family: "Roboto", Helvetica, Arial, sans-serif;}
            *, *::before, *::after {box-sizing: border-box;}
        </style>
    </head>
    <body>
        <h1>Hello world!</h1>
    </body>
    <script type="text/javascript">
        alert('Hello world');
    </script>
</html>
{%- endhighlight -%}


{%- highlight scss -%}
//! Aspect ratio mixin
@mixin ratio($w, $h) {
    position: relative;
    padding-top: $h / $w * 100%;
    background-color: rgba(black, 0.52);
}
my.simple#selector[attribute^="value"] {
    color: #9c27b0;
}
{%- endhighlight -%}

-----

## Embeds
Here, I embed various common widgets (a YouTube video, a regular video, a Twitter post, and a Twitter Timeline) using very little HTML. The HTML looks like so.

{%- highlight html -%}
<figure class="<small, med, large> <no-stick>">
    <div class="media-box"> <!-- Gives the content a ratio of 16:9, optional -->
        <!-- The content itself -->
    </div>
    <figcaption>Some amazing caption no one’s gonna read.</figcaption>
</figure>
{%- endhighlight -%}

<figure>
    <div class="media-box">
        <iframe src="https://www.youtube.com/embed/1-BSTM2is7I?modestbranding=1&rel=0" frameborder="0" allow="encrypted-media" title="I Don’t Want to Say Goodbye – YouTube" allowfullscreen></iframe>
    </div>
    <figcaption>I Don’t Want to Say Goodbye – YouTube</figcaption>
</figure>


### Twitter posts

<div class="grid top">
    <div class="s12 m6">
        <figure class="no-stick">
            <a class="twitter-timeline" data-height="500" href="https://twitter.com/MindfulMinun?ref_src=twsrc%5Etfw">Tweets by MindfulMinun</a>
        </figure>
    </div>
    <div class="s12 m6">
        <figure class="no-stick">
            <blockquote class="twitter-tweet" data-lang="en">
                <p lang="en" dir="ltr">
                    If I made a romance game for my crush, do you think it would stay forever in beta just like me?
                </p>&mdash; Benji (@MindfulMinun) <a href="https://twitter.com/MindfulMinun/status/922978526197899264?ref_src=twsrc%5Etfw">October 25, 2017</a>
            </blockquote>
        </figure>
    </div>
</div>

<!-- **Lists**

* One, two, three, four
* Who's that knocking at my door?
    * Five, six, seven, eight,
    * Hurry up and don't be late
* Nine, ten, ‘leven, twelve,
* Got a secret I can’t tell.
    * Flap your fins,
    * Flip your tails
* School’s out,
    * Ring the bell!


1. One, two, three, four
2. Who's that knocking at my door?
    1. Five, six, seven, eight,
    2. Hurry up and don't be late
3. Nine, ten, ‘leven, twelve,
4. Got a secret I can’t tell.
    1. Flap your fins,
    2. Flip your tails
5. School’s out,
    1. Ring the bell! -->


<dl>
    <dt>Coffee</dt>
    <dd>A warm caffeinated drink</dd>
    <dt>Soda</dt>
    <dd>A cold caffeinated drink</dd>
    <dt>Tea</dt>
    <dd>Water with leaves</dd>
</dl>

###### Heading level 6
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
