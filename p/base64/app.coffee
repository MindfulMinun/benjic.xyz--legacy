---
---

{% include xyz/textarea.coffee %}

a = document.getElementById 'txt-a'
b = document.getElementById 'txt-b'

btnAtoB = document.getElementById 'btn-atob'
btnBtoA = document.getElementById 'btn-btoa'


btnAtoB.addEventListener 'click', ->
    try
        b.value = window.atob a.value
        xyz.textarea.update b
    catch error
        console.log error.message
        b.value = "[An error occurred while decoding text, likely because text isn’t encoded properly.]"

btnBtoA.addEventListener 'click', ->
    try
        a.value = window.btoa b.value
        xyz.textarea.update a
    catch error
        console.log error.message
        a.value = "[An error occurred while encoding text, likely because text contains non-ASCII characters.]"
