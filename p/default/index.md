---
title: Default Layout
layout: default
description: Default styles and components used throughout this site, all of which are mobile-first and work without JavaScript.
categories: ["p"]
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

### Images and Media

{% include image.html
    caption="Cherry blossom"
    id="cherry-blossom-tree"
    src="/assets/cherry_blossom.jpg"
    style="padding-top:50%; background-color: #53cbbf" %}

<figure>
    <div class="media-box">
        <iframe src="https://www.youtube.com/embed/1-BSTM2is7I?modestbranding=1&rel=0&color=white" frameborder="0" allow="encrypted-media" title="I Don’t Want to Say Goodbye – YouTube" allowfullscreen></iframe>
    </div>
    <figcaption>I Don’t Want to Say Goodbye – YouTube</figcaption>
</figure>



### Lists

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
        1. Flip your tails
5. School’s out,
    1. Ring the bell!


<dl>
    <dt>Coffee</dt>
    <dd>A warm caffeinated drink</dd>
    <dt>Soda</dt>
    <dd>A cold caffeinated drink</dd>
    <dt>Tea</dt>
    <dd>Water with leaves</dd>
</dl>


<link rel="stylesheet" href="/styles/syntax.css">

{%- highlight js -%}
$('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Button that triggered the modal
    var recipient = button.data('whatever'); // Extract info from data-* attributes
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this);
    modal.find('.modal-title').text('New message to ' + recipient);
    modal.find('.modal-body input').val(recipient);
});
{%- endhighlight -%}
