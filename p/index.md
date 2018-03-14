---
layout: default
title: Projects, Tools, & Gadgets
description: >
    A collection of all my projects.
---

# {{ page.title }}

{{ page.description }}


{%- comment %}Set project_pages to be all pages where page[i].categories contains 'p'{% endcomment -%}
{% assign project_pages = site.pages | where: 'categories', 'p' %}
<ul>
{% for project in project_pages %}
    <li>
        <a href="{{ project.url | absolute_url }}"><strong>{{ project.title }}</strong></a>
        <br>
        <p>{{ project.description }}</p>
    </li>
{% endfor %}
</ul>


<!-- * [Hello](/p/)
    <p>lol</p>
* [Blob debugger](/p/blob-debugger/)
    <p>hello</p> -->
