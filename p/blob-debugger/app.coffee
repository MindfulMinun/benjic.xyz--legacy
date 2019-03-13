---
---
###
 * Blob chooser
###

{% include xyz/randomInt.coffee %}

xyz.ready ->
    indexInput = document.getElementById 'index'
    button     = document.getElementById 'new-blob'
    renderBox  = document.getElementById 'blob-result'
    indexBox   = document.getElementById 'number'

    blobs = null

    f = ->
        i = if (
            indexInput.value isnt "" and
            0 <= +indexInput.value <= blobs.length
        ) then +indexInput.value else xyz.randomInt(0, blobs.length - 1)

        blob = twemoji.parse blobs[i]
        console.log blob
        renderBox.innerHTML = blob
        indexBox.innerHTML  = i

    check = ->
        if not xyz.blobs?
            requestAnimationFrame check
        else
            blobs = xyz.blobs
            f()
    check()


    button.addEventListener 'click', f
