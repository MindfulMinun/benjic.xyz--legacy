---
---
#! NOTE: This script is loaded asyncronously, but the DOM will my mostly loaded by now

#! Extended math
Math.randomInt = (min, max) ->
    if arguments.length is 1
        max = min
        min = 0

    min = Math.ceil(min)
    max = Math.floor(max)
    return Math.floor(Math.random() * (max - min + 1)) + min


#! Random blobs
xyz.footerBlob =
    blobs: {{ site.data.blobs | jsonify }}
    newBlob: (index) ->
        blobRibbon = document.getElementById "footer--random-blob"
        return if !blobRibbon

        x = if typeof index is "number"
                index
            else
                Math.randomInt(0, this.blobs.length - 1)

        selectedBlob = twemoji.parse this.blobs[x]

        blobRibbon.innerHTML = selectedBlob

        document.dispatchEvent(
            new Event 'blob-updated'
        )

        return selectedBlob

xyz.footerBlob.newBlob();
