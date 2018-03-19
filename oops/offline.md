---
title: Offline
layout: content-only
permalink: /oops/offline.html
---
{% capture scss %}
//! <!-- Make this as tiny as possible (added html comment bc syntax is annoying)
@import "_vars";
main .container {
    position: relative;
    top: 50%;
    width: 100%;
    transform: translateY(-50%);
}
//-->
{% endcapture %}<style>{{ scss | scssify }}</style>

# Offline

The internet’s broken.

<button class="flat-btn-dark">uhh hi</button>


<!-- > _“If you search for it, you’ll find everything.” &mdash;&nbsp;Short&nbsp;Thoughts, Nichijou_ -->
