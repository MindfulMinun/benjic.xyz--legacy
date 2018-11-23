---
title: About me
layout: default
description: >
    Hi, I’m Benji. I'm into programming and playing piano.
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
<hr>

<section>
    <h2>Projects &amp; Posts</h2>
    <p>Some <a href="/p/">projects</a> and posts I’ve written.</p>

    <div class="horizontal-scroller">
        {% assign projects = site.pages | where: 'categories', 'p' %}
        {% assign posts = site.posts %}
        <!-- Concatenate arrays and sort from newest to oldest -->
        {% assign PandP = projects | concat: posts | sort: 'last_mod' | reverse %}

        {%- for p in PandP -%}
            <!-- Include pages that (are a post) or (are a project) -->
            <div class="horizontal-scroller__element">
                <a class="post-card block"
                    href="{{ p.url | absolute_url }}"
                    {% if p.image -%}
                        style="background-color:{{ p.image.color }};background-image:url('{{ p.image.src | absolute_url }}')"
                    {%- endif %}>
                    <div class="post-card-content">
                        <strong>{{ p.title | escape }}</strong>
                        <p class="no-margin">{{
                            p.excerpt | markdownify | remove: '<p>' | remove: '</p>' | truncatewords: 8
                        }}</p>
                    </div>
                </a>
            </div>
        {%- endfor -%}
    </div>
</section>

<section markdown="1">
## About me

Hi, I'm Benji. You may know me as [@MindfulMinun][twitter]
on the Internet. I'm a senior at [Legacy ECHS][lechs],
planning to graduate with my Associate’s in 2019.
I'm into programming and playing piano.

{% include image.html
    caption="This is what I look like."
    id="pfp" class="small"
    suppressLink="true"
    src="/assets/pfp-4-3.jpg"
    style="padding-top:75%;background:#1d0c47;background: radial-gradient(#c84d65, #1d0c47);" %}

During my time in high school so far, I've taken
classes such as AP Computer Science,
AP Spanish Language, AP Spanish Literature,
Engineering I and II, and I'm currently taking
Calculus.

In my leisure time, I [code][github], [tweet][twitter],
and play some piano. I can solve a Rubik's cube under
2 minutes, and I speak both English and Spanish fluently.

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
            <source src="/assets/goodbye/Don't_Ever_Forget--Musescore-2018-11-23.ogg" type="audio/ogg">
            <source src="/assets/goodbye/Don't_Ever_Forget--Musescore-2018-11-23.mp3" type="audio/mpeg">
        </audio>
        <div class="audio-player__content">
            <span class="title">Don’t Ever Forget &mdash; Arata Iiyoshi</span>
            <span class="song-data">
                <!-- <a href="/assets/goodbye/Copia de Goodbye.zip" class="txt-alike"
                    download="Don't Ever Forget.zip"
                    title="Download Garageband Project file (zipped)"
                    aria-label="Download Garageband Project file (zipped)">
                    <span class="txt-u">Garageband</span>
                    <i class="material-icons" style="font-size: 1.3em; vertical-align: middle;">get_app</i>
                </a> -->
                <a href="https://musescore.com/user/16771186/scores/5222447"
                    class="txt-alike" target="_blank"
                    aria-label="View in Musescore (opens a new window)"
                    >
                    View in Musescore
                    <i class="material-icons" style="font-size: 1.3em; vertical-align: middle;">open_in_new</i>
                </a>
                <a href="/assets/goodbye/Don't_Ever_Forget--Musescore-2018-11-23.mp3" class="txt-alike"
                    download="Don't Ever Forget.mp3"
                    title="Download mp3"
                    aria-label="Download mp3">
                    .mp3
                    <i class="material-icons" style="font-size: 1.3em; vertical-align: middle;">get_app</i>
                </a>
                <a href="/assets/goodbye/Don't_Ever_Forget--Musescore-2018-11-23.ogg" class="txt-alike"
                    download="Don't Ever Forget.ogg"
                    title="Download ogg"
                    aria-label="Download ogg">
                    .ogg
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
## Code &amp; stuff

I love to code. It’s my dream to write code for a living.
I picked up HTML, (S)CSS, and JavaScript during
my freshman year of high school, while messing around with
Firefox Scratchpad. I'm now fluent in front-end workflow,
combining technologies ranging from ServiceWorker, Jekyll,
GitHub, and Netlify.

The [video](https://codepen.io/MindfulMinun/pen/OzbZzB)
and [audio](https://codepen.io/MindfulMinun/pen/vRjPwP)
players above were both created by yours truly.
I've also made [layouts][layout] and other [HTML things][projects].

Near the end of my Sopohmore year, I went on to focus on Node.js,
a back-end JavaScript runtime. Here, I picked up CoffeeScript,
a Python-esque language that transpiles to JavaScript.
With these, I created [Haruka][haruka], a Discord bot.
</section>

<section markdown="1">
## Contact

You can find me all over the Internet.
For business inquiries, [send me an email.](mailto:importantmails4bc@gmail.com)
For pretty much anything else, feel free to contact me via [Twitter][twitter] or
Discord (MindfulMinun#3386).
I'm also on [GitHub][github], [CodePen][codepen], and [Glitch][glitch].

[Tweet to @MindfulMinun][twitter-intent]
</section>

<!-- References -->
[lechs]: https://lechs.taylorisd.org
{: target="_blank" }

[twitter]: https://twitter.com/MindfulMinun
{: target="_blank" }

[twitter-intent]: https://twitter.com/intent/tweet?screen_name=MindfulMinun&ref_src=twsrc%5Etfw "Tweet to @MindfulMinun"
{: class="twitter-mention-button" data-size="large" data-show-count="true" }

[haruka]: https://github.com/MindfulMinun/discord-haruka
{: target="_blank" }

[github]: https://github.com/MindfulMinun
{: target="_blank" }

[codepen]: https://codepen.io/MindfulMinun
{: target="_blank" }

[glitch]: https://glitch.com/@MindfulMinun
{: target="_blank" }

[projects]: /p/
[layout]: /p/default/
