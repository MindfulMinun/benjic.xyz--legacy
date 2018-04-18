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

Hi, I’m Benji. I’m a high school student at [Legacy ECHS][lechs] in Taylor and I’ll be graduating with my Associate’s degree in 2019.

<figure id="pfp" class="small">
    <div class="media-box" style="padding-top: 75%; background: #1d0c47; background: radial-gradient(#c84d65, #1d0c47);">
        <img src="{% link /assets/pfp-4-3.jpg %}" alt="Benjamin Cerda" title="Benjamin Cerda" aria-labelledby="pfp-caption">
    </div>
    <figcaption id="pfp-caption">This is what I look like.</figcaption>
</figure>

In my free time, I like to code and play the piano. I code in HTML, SCSS, and CoffeeScript. I speak both English and Spanish fluently.

<figure id="piano" class="large">
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
    <!-- <figcaption></figcaption> -->
</figure>


<h2 class="h3" id="elsewhere">Elsewhere</h2>

You can find me on the Internet as [@MindfulMinun on Twitter][twitter]. I’m also on [GitHub][github] and [CodePen][codepen].


[lechs]:   https://lechs.taylorisd.org
[twitter]: https://twitter.com/MindfulMinun
[github]:  https://github.com/mindfulminun
[codepen]: https://codepen.io/MindfulMinun
