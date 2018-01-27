---
title: Default layout
layout: default
description: This is a default layout.
---

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

The following is a paragraph: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

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

        <div>
            <div class="inline-block">
                <button class="icon-btn left flat-btn-light"><i class="material-icons">check</i></button>
                <button class="icon-btn left raised-btn"><i class="material-icons">check</i></button>
                <button class="icon-btn left raised-btn-2"><i class="material-icons">check</i></button>
            </div>
            <div class="inline-block" style="height: 56px; margin: 8px;">
                <button class="icon-btn small left flat-btn-light"><i class="material-icons">check</i></button>
                <button class="icon-btn small left raised-btn"><i class="material-icons">check</i></button>
                <button class="icon-btn small left raised-btn-2"><i class="material-icons">check</i></button>
            </div>
        </div>

        <div>
            <div class="inline-block">
                <button disabled class="icon-btn left flat-btn-light"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn left raised-btn"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn left raised-btn-2"><i class="material-icons">clear</i></button>
            </div>
            <div class="inline-block" style="height: 56px; margin: 8px;">
                <button disabled class="icon-btn small left flat-btn-light"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn small left raised-btn"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn small left raised-btn-2"><i class="material-icons">clear</i></button>
            </div>
        </div>
    </div>
    <div class="s12 m6" style="background-color: black; text-align: center;">

        <div>
            <div class="inline-block">
                <button class="icon-btn left flat-btn-dark"><i class="material-icons">check</i></button>
                <button class="icon-btn left raised-btn"><i class="material-icons">check</i></button>
                <button class="icon-btn left raised-btn-2"><i class="material-icons">check</i></button>
            </div>
            <div class="inline-block" style="height: 56px; margin: 8px;">
                <button class="icon-btn small left flat-btn-dark"><i class="material-icons">check</i></button>
                <button class="icon-btn small left raised-btn"><i class="material-icons">check</i></button>
                <button class="icon-btn small left raised-btn-2"><i class="material-icons">check</i></button>
            </div>
        </div>

        <div>
            <div class="inline-block">
                <button disabled class="icon-btn left flat-btn-dark"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn left raised-btn"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn left raised-btn-2"><i class="material-icons">clear</i></button>
            </div>
            <div class="inline-block" style="height: 56px; margin: 8px;">
                <button disabled class="icon-btn small left flat-btn-dark"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn small left raised-btn"><i class="material-icons">clear</i></button>
                <button disabled class="icon-btn small left raised-btn-2"><i class="material-icons">clear</i></button>
            </div>
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
    caption="Cherry blossom tree"
    caption="Sample Image"
    id="cherry-blossom-tree"
    src="/assets/cherry_blossom.jpg"
    style="padding-top:50%; background-color: #53cbbf" %}


| My tabular data | My second header     | My third header |
| :-------------- | :------------------- | :-------------- |
| Item One        | Item Two             | Item Three      |
| Item Four       | Item Five            | Item Six        |
| Item Seven      | Item Eight           | Item Nine       |
| Item Ten        | Item Eleven          | Item Twelve     |


<blockquote>
    &gt; coolguy64: uhh how do i jump<br>
    &gt; peachmango: <kbd>Alt + F4</kbd><br>
    &gt; coolguy64: thanks<br>
    <em>coolguy64 has left the game</em>
</blockquote>


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
