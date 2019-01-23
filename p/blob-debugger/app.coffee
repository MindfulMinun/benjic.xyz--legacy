---
---
###
 * Blob chooser
###
xyz.ready ->
    'use strict'
    indexInput = document.getElementById 'index'
    button     = document.getElementById 'new-blob'
    renderBox  = document.getElementById 'blob-result'
    indexBox   = document.getElementById 'number'

    f = ->
        index = if (
            indexInput.value isnt "" and
            0 <= +indexInput.value <= {{ site.data.blobs | size | minus: 1 }}
        ) then +indexInput.value else null

        blob = xyz.blobs.pull index
        renderBox.innerHTML = blob.blob
        indexBox.innerHTML  = blob.index

    f()

    button.addEventListener 'click', f
