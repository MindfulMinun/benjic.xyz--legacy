---
title: About me
layout: default
description: >
    Hi, I’m Benji. I like programming and playing piano.
image:
    src: /assets/mom-and-i.jpg
    alt: Benji
scripts:
    - async: true
      src: "https://platform.twitter.com/widgets.js"
    - async: true
      src: "/scripts/audio-player.js"
afterHead: >
    <style>h2 {font-size: 1.75rem;}</style>
    <script src="/scripts/xyz-player.js" onload="XyzPlayer.register()"></script>
---

# Hi, I’m Benji.
I like programming and playing piano. I should probably be studying.
<hr>

<section>
    <h2>Projects</h2>
    <p>Some <a href="/p/">projects</a> I’ve worked on.</p>

    <div class="horizontal-scroller">
        {% assign posts = site.posts %}
        {% assign projects = site.data.projects %}
        <!-- Concatenate arrays and sort from newest to oldest -->
        {% assign PandP = posts | concat: projects %}

        {%- for p in PandP -%}
            <!-- Include pages that (are a post) or (are a project) -->
            <div class="horizontal-scroller__element">
                <a class="post-card"
                    {% if p.source -%}
                    href="{{ p.source }}"
                    {%- else -%}
                    href="{{ p.url | absolute_url }}"
                    {%- endif %}
                    {% if p.image -%}
                        style="background-color:{{ p.image.color }};background-image:url('{{ p.image.src | absolute_url }}')"
                    {%- endif %}>
                    <div class="post-card-content">
                        <strong>{{ p.title | escape }}</strong>
                        <p class="no-margin">

                        {%- if p.excerpt -%}
                        {{ p.excerpt | markdownify | remove: '<p>' | remove: '</p>' | truncatewords: 8 }}
                        {%- elsif p.hook -%}
                        {{ p.hook | markdownify | remove: '<p>' | remove: '</p>' | truncatewords: 8 }}
                        {%- else -%}
                        {{ p.description | markdownify | remove: '<p>' | remove: '</p>' | truncatewords: 8 }}
                        {%- endif -%}

                        </p>
                    </div>
                </a>
            </div>
        {%- endfor -%}
    </div>
</section>

<section markdown="1">
## About me

Hi, I'm Benji. You might know my as [@MindfulMinun][twitter] online. I graduated from both [Legacy ECHS](https://lechs.taylorisd.org) and [Temple College](https://templejc.edu) late this spring with my HS diploma and an Associate of Arts respectively. I’m currently a sophomore at [UT Dallas](https://utdallas.edu), majoring in Computer Science. I like to write code and play the piano.

{% comment %}
    {% include image.html
        caption="This is what I look like."
        id="pfp" class="small"
        suppressLink="true"
        src="/assets/pfp-4-3.jpg"
        style="padding-top:75%;background:#1d0c47;background:radial-gradient(#c84d65, #1d0c47);" %}
{% endcomment %}

{% include image.html
    caption="My mom and I."
    id="pfp" class="small"
    suppressLink="true"
    src="/assets/mom-and-i.jpg"
    style="padding-top:100%;background:#759b86;background:radial-gradient(#759b86, #716060);" %}

In my leisure time, I like to [write code][github], [tweet tweets][twitter], and play piano and Smash. I can solve a Rubik's cube under 2 minutes, and I speak both English and Spanish fluently.
</section>

{% comment %}
<figure id="piano">
    <div class="media-box">
        <iframe src="/media/goodbye/" aria-labelledby="piano-caption" frameborder="0" allow="encrypted-media" title="Don’t Ever Forget – Video" allowfullscreen></iframe>
    </div>
    <figcaption id="piano-caption">
        An excerpt of <em>Don’t Ever Forget</em>.
    </figcaption>
</figure>
{% endcomment %}


<figure>
    <div class="media-box">
        <xyz-player src="https://benjic.xyz/assets/goodbye/goodbye.mp4"></xyz-player>
    </div>
    <noscript>
        <div class="block-warn">
            <p>JavaScript must be enabled to play this video</p>
        </div>
    </noscript>
    <figcaption>An excerpt of <em>Don't Ever Forget</em>.</figcaption>
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
                    <i class="material-icons audio-player__icon">get_app</i>
                </a> -->
                <a href="https://musescore.com/user/16771186/scores/5222447"
                    class="txt-alike" target="_blank"
                    aria-label="View in Musescore (opens new tab)"
                    >
                    View in Musescore
                    <i class="material-icons audio-player__icon">open_in_new</i>
                </a>
                <a href="/assets/goodbye/Don't_Ever_Forget--Musescore-2018-11-23.mp3" class="txt-alike"
                    download="Don't Ever Forget.mp3"
                    title="Download mp3"
                    aria-label="Download mp3">
                    .mp3
                    <i class="material-icons audio-player__icon">get_app</i>
                </a>
                <a href="/assets/goodbye/Don't_Ever_Forget--Musescore-2018-11-23.ogg" class="txt-alike"
                    download="Don't Ever Forget.ogg"
                    title="Download ogg"
                    aria-label="Download ogg">
                    .ogg
                    <i class="material-icons audio-player__icon">get_app</i>
                </a>
            </span>
        </div>
    </div>
    <noscript>
        <div class="block-warn">
            <p>JavaScript must be enabled to play audio.</p>
        </div>
    </noscript>
</figure>

<section markdown="1">
## Code &amp; stuff

I love to code. It’s my dream to write code for a living. I picked up JavaScript during my freshman year of high school while messing around with Firefox Scratchpad. I naturally went on to learn the other two web languages: HTML and CSS. I'm now fluent in front-end workflow, combining technologies ranging from ServiceWorker, Jekyll, Vue, GitHub, Netlify, Heroku, you name it.

The [video](https://github.com/MindfulMinun/xyz-custom-elements) and [audio](https://codepen.io/MindfulMinun/pen/vRjPwP) players above were both created by yours truly. I've also made [layouts][layout] and other [HTML things][projects].

Near the end of my Sopohmore year, I went on to focus on Node.js, a back-end JavaScript runtime. Here, I picked up CoffeeScript, a Python-esque language that transpiles to JavaScript. With these, I created [Haruka][haruka], a Discord bot.

This year, I've worked some more with Node.js and created [@NichijouEbooks][NichijouEbooks], a Twitter bot that posts randomly-formulated strings from quotes taken from the Nichijou anime. [Her repository is also on GitHub.](https://github.com/MindfulMinun/nichijouebooks)
</section>

<section markdown="1">
## Contact

You can find me all over the Internet as MindfulMinun, I can [prove it][keybase]. For business inquiries, [send me an email](mailto:importantmails4bc@gmail.com). For pretty much anything else, get it touch with me via [Twitter][twitter] or Discord (MindfulMinun#3386). I'm also on [GitHub][github], [CodePen][codepen], [Glitch][glitch], [Keybase][keybase], and many other places. Feel free to say hi!

[Tweet to @MindfulMinun][twitter-intent]
</section>

<!-- References -->
[twitter]: https://twitter.com/MindfulMinun

[twitter-intent]: https://twitter.com/intent/tweet?screen_name=MindfulMinun&ref_src=twsrc%5Etfw "Tweet to @MindfulMinun"
{: class="twitter-mention-button" data-size="large" data-show-count="true" }

[haruka]: https://github.com/MindfulMinun/discord-haruka
[NichijouEbooks]: https://twitter.com/NichijouEbooks
[github]: https://github.com/MindfulMinun
[codepen]: https://codepen.io/MindfulMinun
[glitch]: https://glitch.com/@MindfulMinun
[keybase]: https://keybase.io/mindfulminun
[projects]: /p/
[layout]: /p/default/
