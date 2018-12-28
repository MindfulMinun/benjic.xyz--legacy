---
title: Default Layout
layout: default
description: Default styles and components used throughout this site, all of which are mobile-first and work without JavaScript.
excerpt: Mobile-first CSS layout.
categories: ['p']
last_mod: 2018-07-01 00:00:00 CDT

banners:
    -
        id: "default-layout--sample-banner"
        content: >
            Sample banner. This banner is consistent, meaning it will reappear on refresh
        consistent: true
scripts:
    -
        async: true
        src: "https://platform.twitter.com/widgets.js"
styles:
    -
        href: "/styles/syntax.css"
---

# Default Layout and Styles

The following is a paragraph demonstrating basic text: **Donut wafer cupcake** icing bonbon <mark>cheesecake dessert muffin</mark> chocolate cake. Dessert <ins>tart dragée marshmallow</ins> carrot cake. [Donut sweet roll](#) chocolate bar brownie sesame snaps. Oat cake ~~bonbon jelly beans~~ gingerbread lemon drops. _Bear claw chocolate bar_ jelly-o sesame snaps biscuit pastry dragée.

- I love you ~~watanabe~~.
- I'm [Link][link].
- Usar negritas es **audaz.** Usar cursivas es _elegante._ Usar ambas es _**como si estuvieras gritándome.**_

### Ruby Text

<p>
    <span class="ruby-group"><!--
    ---><span class="ruby tooltip" data-tooltip="Kyōto ni ikitai, nihongo wo chotto wakarimasu." lang="ja"><!--
        ---><ruby>京都<span class="sr-only">（</span><rt>きょうと</rt><span class="sr-only">）</span></ruby><!--
        --->に<!--
        ---><ruby>行<span class="sr-only">（</span><rt>い</rt><span class="sr-only">）</span></ruby><!--
        --->きたい、<!--
        ---><ruby>日本語<span class="sr-only">（</span><rt>にほんご</rt><span class="sr-only">）</span></ruby><!--
        --->をちょっとわかります。<!--
    ---></span><!--
    ---><em>I want to go to Kyoto, I can understand a bit of Japanese.</em>
    </span>
</p>


### Blockquotes & Warnings

<blockquote>
    <p>
        —Está en el sótano del comedor— explicó, aligerada su dicción por la angustia—. Es mío, es mío; yo lo descubrí en la niñez, antes de la edad escolar. La escalera del sótano es empinada, mis tíos me tenían prohibido el descenso, pero alguien dijo que había un mundo en el sótano. Se refería, lo supe después, a un baúl, pero yo entendí que había un mundo. Bajé secretamente, rodé por la escalera vedada, caí. Al abrir los ojos, vi el Aleph.
    </p>
    <cite>&mdash;&nbsp;El Aleph, Jorge Luis Borges</cite>
</blockquote>

<div class="block-warn">
    <p>
        <strong>I'm a warning.</strong><br>
        I help keep dumb users like you out of trouble.
    </p>
</div>

### Code and stuff

{%- highlight coffee -%}
class Pokemon
    constructor: (@name) ->
        alert "Go! #{@name}!"

    attack: (atk) ->
        alert "#{@name} used #{atk}!"

class Minun extends Pokemon
    attack: ->
        super "Cheer"

MyMinun = new Minun 'Mindful'
MyMinun.attack()
# -> "Go! Mindful!"
# -> "Mindful used Cheer!"
{%- endhighlight -%}

Press <kbd><kbd>&#8984; Command</kbd> + <kbd>Q</kbd></kbd> to remove lag.
Don't run `sudo rm -rf /`.

### Media

{% include image.html
    caption="Cherry blossom"
    id="cherry-blossom-tree"
    src="/assets/cherry_blossom.jpg"
    style="padding-top:50%; background-color: #53cbbf" %}

<figure>
    <div class="media-box">
        <iframe src="https://www.youtube.com/embed/yD2FSwTy2lw?modestbranding=1&rel=0&color=white&showinfo=0" frameborder="0" allow="encrypted-media" title="No one's around to help. – YouTube" allowfullscreen></iframe>
    </div>
    <figcaption>No one's around to help. – YouTube</figcaption>
</figure>

<figure>
    <div class="media-box" style="padding-top: 100%;">
        <iframe src="/media/bongo/" title="Bongo"></iframe>
    </div>
    <figcaption>Bongo.mp4</figcaption>
</figure>


[link]: https://en.wikipedia.org/wiki/Link_(The_Legend_of_Zelda) "Link (The Legend of Zelda) • Wikipedia"
{: target="_blank" }
