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
---

# Default Layout and Styles

The following is a paragraph demonstrating basic text: **Donut wafer cupcake** icing bonbon cheesecake dessert muffin chocolate cake. Dessert tart dragée marshmallow carrot cake. [Donut sweet roll](#) chocolate bar brownie sesame snaps. Oat cake bonbon jelly beans gingerbread lemon drops. _Bear claw chocolate bar_ jelly-o sesame snaps biscuit pastry dragée.

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


### Blockquotes
<blockquote>
    <p>
        —Está en el sótano del comedor— explicó, aligerada su dicción por la angustia—. Es mío, es mío; yo lo descubrí en la niñez, antes de la edad escolar. La escalera del sótano es empinada, mis tíos me tenían prohibido el descenso, pero alguien dijo que había un mundo en el sótano. Se refería, lo supe después, a un baúl, pero yo entendí que había un mundo. Bajé secretamente, rodé por la escalera vedada, caí. Al abrir los ojos, vi el Aleph.
    </p>
    <cite>&mdash;&nbsp;El Aleph, Jorge Luis Borges</cite>
</blockquote>

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

### Lists

1. European Theater
    * Operation Torch
        * Invasion of North Africa
    *  Operation Overlord
        * Landings at Normandy (NW France)
        * D-Day
2. Pacific Theater
    * Midway
    * Pearl Harbor
    * Island Hopping
    * Little Boy & Fat Man (Manhattan Project)
        * Bombing of Hiroshima & Nagasaki
3. Home Front
    * Women
        * They were actually in the war, fighting
        * Rosie the Riveter
    * Rationing
        * Can't buy things w/o coupon
        * Victory Bonds / Victory Gardens
            * War Bonds (where you just give money to government)
            * Gov. would promise money given plus interest after war ends
    * Japanese Internment Camps

<dl>
    <dt>Coffee</dt>
    <dd>A warm caffeinated drink</dd>
    <dt>Soda</dt>
    <dd>A cold caffeinated drink</dd>
    <dt>Tea</dt>
    <dd>Water with leaves</dd>
</dl>


<link rel="stylesheet" href="/styles/syntax.css">

{%- highlight coffeescript -%}
describe "xyz", ->
    # ...
    describe ".ready", ->
        it "should execute function once DOM has been loaded", (done) ->
            xyz.ready done
        it "should execute immediately if DOM is already loaded", ->
            xyz.ready ->
                start = performance.now()
                xyz.ready ->
                    end = performance.now()
                    chai.assert.isAtMost(end - start, 5)
{%- endhighlight -%}
