---
title: All posts
layout: default
# description: >
comments: true
---


# All posts

<ul>
{%- for post in site.posts -%}
    <li>
        <a href="{{ post.url }}">{{ post.title }}</a><br>
        <p>{{ post.description | strip_html }}</p>
    </li>
{%- endfor -%}
</ul>
