---
title: Offline
layout: content-only
permalink: /oops/offline.html
sitemap: false
---
{% capture scss %}
//<!-- Make this as tiny as possible (added html comment bc syntax is annoying)
@import "_vars";
main .container {
    position: relative;
    top: 50%;
    width: 100%;
    transform: translateY(-50%);
    h1 {margin-top: 0;}
}
//-->
{% endcapture %}<style>{{ scss | scssify }}</style>

# Offline

One of three things happened.

1. You’re offline.
2. I forgot to start `jekyll serve`.
3. My web server diedededed.

_Protip: Press_ <kbd><kbd>&#8984; Command</kbd> + <kbd>R</kbd></kbd> _to refresh._

<!-- > _“If you search for it, you’ll find everything.” &mdash;&nbsp;Short&nbsp;Thoughts, Nichijou_ -->
