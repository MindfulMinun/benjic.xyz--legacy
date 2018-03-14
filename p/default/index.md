---
title: Default Layout
layout: default
description: This page showcases default styles and components used throughout this site, all of which are mobile-first and work without JavaScript.
categories: ["p"]
banners:
    -
        id: "default-layout--sample-banner"
        content: >
            Sample banner. This banner is consistent, meaning it will reappear on refresh
        consistent: true
    -
        id: "default-layout--sample-banner-2"
        content: >
            This banner is also consistent.
        consistent: true
---

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

The following is a paragraph: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Styled text: I want to go to Kyoto.
<span class="ruby tooltip" data-tooltip="Kyōto ni ikitai." lang="ja">
    <ruby>京都<span class="sr-only">&nbsp;(</span><rt>きょうと</rt><span class="sr-only">)</span></ruby>
    に
    <ruby>行<span class="sr-only">&nbsp;(</span><rt>い</rt><span class="sr-only">)</span></ruby>
    きたい。
</span>

<div class="grid" style="text-align: center;">
    <div class="s6" style="background-color: black;">
        <button class="flat-btn-dark">Dark flat button</button>
        <button class="flat-btn-dark" disabled>Dark disabled flat button</button>
    </div>
    <div class="s6" style="background-color: white;">
        <button class="flat-btn-light">Light flat button</button>
        <button class="flat-btn-light" disabled>Light disabled flat button</button>
    </div>
    <div class="s12 m6" style="background-color: white; text-align: center;">

        <div class="i-block">
            <button class="icon-btn left flat-btn-light"><i class="material-icons">check</i></button>
            <button class="icon-btn left raised-btn"><i class="material-icons">check</i></button>
            <button class="icon-btn left raised-btn-2"><i class="material-icons">check</i></button>
        </div>

        <div class="i-block">
            <button disabled class="icon-btn left flat-btn-light"><i class="material-icons">clear</i></button>
            <button disabled class="icon-btn left raised-btn"><i class="material-icons">clear</i></button>
            <button disabled class="icon-btn left raised-btn-2"><i class="material-icons">clear</i></button>
        </div>
    </div>
    <div class="s12 m6" style="background-color: black; text-align: center;">

        <div class="inline-block">
            <button class="icon-btn left flat-btn-dark"><i class="material-icons">check</i></button>
            <button class="icon-btn left raised-btn"><i class="material-icons">check</i></button>
            <button class="icon-btn left raised-btn-2"><i class="material-icons">check</i></button>
        </div>

        <div class="inline-block">
            <button disabled class="icon-btn left flat-btn-dark"><i class="material-icons">clear</i></button>
            <button disabled class="icon-btn left raised-btn"><i class="material-icons">clear</i></button>
            <button disabled class="icon-btn left raised-btn-2"><i class="material-icons">clear</i></button>
        </div>

    </div>
</div>



Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

<div class="grid" style="text-align: center">
    <div class="s6" style="background-color: black;">
        <button class="raised-btn">Raised button</button>
        <button class="raised-btn-2">Raised button secondary</button><br>
        <button class="raised-btn" disabled>Disabled button</button>
        <button class="raised-btn-2" disabled>Disabled button secondary</button>
    </div>
    <div class="s6" style="background-color: white;">
        <button class="raised-btn">Raised button</button>
        <button class="raised-btn-2">Raised button secondary</button><br>
        <button class="raised-btn" disabled>Disabled button</button>
        <button class="raised-btn-2" disabled>Disabled button secondary</button>
    </div>
</div>



Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


{% include image.html
    caption="Sample Image"
    id="cherry-blossom-tree"
    src="/assets/cherry_blossom.jpg"
    style="padding-top:50%; background-color: #53cbbf" %}



{%- capture mi -%}
    <span class="ruby tooltip" data-tooltip="mi" lang="ja"><ruby>見<span class="sr-only">&nbsp;(</span><rt>み</rt><span class="sr-only">)</span></ruby></span>
{%- endcapture -%}
{%- capture miru -%}
    <span class="ruby tooltip" data-tooltip="miru" lang="ja"><ruby>見<span class="sr-only">&nbsp;(</span><rt>み</rt><span class="sr-only">)</span></ruby>る</span>
{%- endcapture -%}
{%- capture mimasu -%}
    <span class="ruby tooltip" data-tooltip="mimasu" lang="ja"><ruby>見<span class="sr-only">&nbsp;(</span><rt>み</rt><span class="sr-only">)</span></ruby>ます</span>
{%- endcapture -%}
{%- capture minai -%}
    <span class="ruby tooltip" data-tooltip="minai" lang="ja"><ruby>見<span class="sr-only">&nbsp;(</span><rt>み</rt><span class="sr-only">)</span></ruby>ない</span>
{%- endcapture -%}
{%- capture mimasen -%}
    <span class="ruby tooltip" data-tooltip="mimasen" lang="ja"><ruby>見<span class="sr-only">&nbsp;(</span><rt>み</rt><span class="sr-only">)</span></ruby>ません</span>
{%- endcapture -%}

### Japanese Verb Conjugation

| {{ miru }}: to see / watch      | Casual         | Polite         |
| :------------- | :------------- | :------------- |
| Stem           | {{ mi }}       | {{ mi }}       |
| Plain form     | {{ miru }}     | {{ mimasu }}   |
| Negative form  | {{ minai }}    | {{ mimasen }}  |






> “That should be the ringtone for every payphone.”

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

{%- highlight javascript -%}
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
