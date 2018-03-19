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
        {%- if post.draft -%}
        <a href="{{ post.url | absolute_url }}">{{ post.title }}&nbsp;[draft]</a><br>
        {%- else -%}
        <a href="{{ post.url | absolute_url }}">{{ post.title }}</a><br>
        {%- endif -%}
        <p>{{ post.excerpt | strip_html }}</p>
    </li>
{%- endfor -%}
</ul>
