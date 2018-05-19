---
title: About me
layout: default
description: >
    Hi, I’m Benji. I like coding things for the Internet and playing the piano.
image:
    src: /assets/pfp-4-3.jpg
    alt: Benji
scripts:
    -
        defer: true
        src: "/scripts/audio-player.js"
# comments: true
---

# Benji
Student by day, developer by night.
<hr>

{%- if site.posts.size >= 1 -%}
<h2 class="h3" id="posts">Posts</h2>

<div class="horizontal-scroller">
    {%- for post in site.posts limit:6 -%}
    <div class="horizontal-scroller__element">
        <a class="post-card block" href="{{ post.url | absolute_url }}"
            style="background-color:{{ post.image.color }};background-image:url('{{ post.image.src | absolute_url }}')"
            >
            <div class="post-card-content">
                {%- if post.draft -%}
                <strong>{{ post.title }}&nbsp;[draft]</strong><br>
                {%- else -%}
                <strong>{{ post.title }}</strong><br>
                {%- endif -%}
                <p class="no-margin">{{ post.excerpt | markdownify | remove: '<p>' | remove: '</p>' }}</p>
            </div>
        </a>
    </div>
    {%- endfor -%}
</div>
{%- endif -%}

<h2 class="h3" id="about-me">About me</h2>

Hi, I’m Benji. I’m a high school student at [Legacy ECHS][lechs] in Taylor and I’ll be graduating with my Associate’s degree in 2019.

{% include image.html
    caption="This is what I look like."
    id="pfp" class="small"
    suppressLink="true"
    src="/assets/pfp-4-3.jpg"
    style="padding-top:75%;background:#1d0c47;background: radial-gradient(#c84d65, #1d0c47);" %}

In my free time, I like to code and play the piano. I code in HTML, SCSS, and CoffeeScript. I speak both English and Spanish fluently.

<figure id="piano">
    <div class="media-box">
        <iframe src="/media/goodbye/" aria-labelledby="piano-caption" frameborder="0" allow="encrypted-media" title="Don’t Ever Forget – Video" allowfullscreen></iframe>
    </div>
    <figcaption id="piano-caption">
        An excerpt of <span class="txt-u">Don’t Ever Forget</span>.
    </figcaption>
</figure>

<figure>
    <div class="audio-player" hidden>
        <audio>
            <source src="/assets/Goodbye-31-Mar-2018.mp3" type="audio/mpeg">
        </audio>
        <div class="audio-player__content">
            <span class="title">Don’t Ever Forget</span>
            <span class="song-data">Arata Iiyoshi</span>
        </div>
    </div>
    <figcaption>
        <noscript>Sorry, but JavaScript must be enabled to play audio.</noscript>
    </figcaption>
</figure>


<h2 class="h3" id="elsewhere">Elsewhere</h2>

You can find me on the Internet as [@MindfulMinun on Twitter][twitter]. I’m also on [GitHub][github] and [CodePen][codepen].


[lechs]:   https://lechs.taylorisd.org
[twitter]: https://twitter.com/MindfulMinun
[github]:  https://github.com/mindfulminun
[codepen]: https://codepen.io/MindfulMinun
