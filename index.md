---
title: About me
layout: default
description: >
    Hi, I’m Benji. I like coding things for the Internet and playing the piano.
image:
    src: /assets/pfp-4-3.jpg
    alt: Benji
scripts:
    - async: true
      src: "https://platform.twitter.com/widgets.js"
    - async: true
      src: "/scripts/audio-player.js"
afterHead: "<style>h2 {font-size: 1.75rem;}</style>"
---

# Benji
Student by day, developer by night.
<hr>


{% if site.posts.size >= 1 -%}
<section>
    <h2 id="posts">Posts</h2>

    <div class="horizontal-scroller">
        {%- for post in site.posts -%}
        <div class="horizontal-scroller__element">
            <a class="post-card block" href="{{ post.url | absolute_url }}"
                style="background-color:{{ post.image.color }};background-image:url('{{ post.image.src | absolute_url }}')">
                <div class="post-card-content">
                    {%- if post.draft -%}
                    <strong>{{ post.title }}&nbsp;[draft]</strong><br>
                    {%- else -%}
                    <strong>{{ post.title }}</strong><br>
                    {%- endif -%}
                    <p class="no-margin">{{-
                        post.excerpt | markdownify | remove: '<p>' | remove: '</p>' | truncatewords: 11
                    -}}</p>
                </div>
            </a>
        </div>
        {%- endfor -%}
    </div>
</section>
{%- endif %}

<section markdown="1">
## About me

Hi, I’m Benji, also known as [@MindfulMinun][twitter] on the Internet. I’m a high school student attending [Legacy ECHS][lechs] in Taylor and I’ll be graduating with my Associate’s degree in 2019.

{% include image.html
    caption="This is what I look like."
    id="pfp" class="small"
    suppressLink="true"
    src="/assets/pfp-4-3.jpg"
    style="padding-top:75%;background:#1d0c47;background: radial-gradient(#c84d65, #1d0c47);" %}

In my leisure time, I love to [write CoffeeScript][github]. It’s my dream to write code for a living. I play the piano often, and I speak both English and Spanish fluently.

</section>

<figure id="piano">
    <div class="media-box">
        <iframe src="/media/goodbye/" aria-labelledby="piano-caption" frameborder="0" allow="encrypted-media" title="Don’t Ever Forget – Video" allowfullscreen></iframe>
    </div>
    <figcaption id="piano-caption">
        An excerpt of <em>Don’t Ever Forget</em>.
    </figcaption>
</figure>

<figure>
    <div class="audio-player" hidden>
        <audio>
            <source src="/assets/goodbye/Goodbye--2018-07-07.mp3" type="audio/mpeg">
        </audio>
        <div class="audio-player__content">
            <span class="title">Don’t Ever Forget &mdash; Arata Iiyoshi</span>
            <span class="song-data">
                <a href="/assets/goodbye/Copia de Goodbye.zip" class="txt-alike"
                    download="Don't Ever Forget.zip"
                    title="Download Garageband Project file (zipped)"
                    aria-label="Download Garageband Project file (zipped)">
                    <span class="txt-u">Garageband</span>
                    <i class="material-icons" style="font-size: 1.3em; vertical-align: middle;">get_app</i>
                </a>
                <a href="/assets/goodbye/Goodbye--2018-07-07.mp3" class="txt-alike"
                    download="Don't Ever Forget.mp3"
                    title="Download mp3"
                    aria-label="Download mp3">
                    <span class="txt-u">.mp3</span>
                    <i class="material-icons" style="font-size: 1.3em; vertical-align: middle;">get_app</i>
                </a>
            </span>
        </div>
    </div>
    <noscript>
        <figcaption>Sorry, but JavaScript must be enabled to play audio.</figcaption>
    </noscript>
</figure>

<section markdown="1">
## Projects

As mentioned before, I absolutely love to code. The [video](https://codepen.io/MindfulMinun/pen/OzbZzB)
and [audio](https://codepen.io/MindfulMinun/pen/vRjPwP) players above were both created
by yours truly. I've also made [layouts][layout] and other [HTML things][projects].
I’ve also worked on some [Node projects][github] as well.
</section>

<section markdown="1">
## Contact

You can find me all over the Internet.
For business inquiries, [send me an email.](mailto:importantmails4bc@gmail.com)
For pretty much anything else, feel free to contact me via [Twitter][twitter].
I'm also on [GitHub][github] and [CodePen][codepen].

[Tweet to @MindfulMinun][twitter-intent]
</section>

<!-- References -->
[lechs]:   https://lechs.taylorisd.org
[twitter]: https://twitter.com/MindfulMinun
{: target="_blank" }
<!-- __ -->

[twitter-intent]: https://twitter.com/intent/tweet?screen_name=MindfulMinun&ref_src=twsrc%5Etfw "Tweet to @MindfulMinun"
{: class="twitter-mention-button" data-size="large" data-show-count="true" }

[github]: https://github.com/MindfulMinun
{: target="_blank" }
<!-- __ -->

[codepen]: https://codepen.io/MindfulMinun
{: target="_blank" }
<!-- __ -->

[projects]: /p/
[layout]: /p/default/
