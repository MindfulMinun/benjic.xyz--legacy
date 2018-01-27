---
---
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
    setBlob: (index) ->
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

xyz.footerBlob.setBlob();


#! Do nothing on "#!" links

xyz.ready(->
    for el in document.querySelectorAll('a[href="#!"]')
        el.addEventListener('click', (e) ->
            e.preventDefault()
            return false;
        )
    for el in document.getElementsByClassName 'e'
        el.innerHTML = twemoji.parse el.innerHTML;
    if location.href.match(/\?[\s\S]*(s=(1|permalink))/gi)
        ga('send', 'event', 'Acquisition', "From share link")
)


onMessage = (event) ->
    #! Check sender origin to be trusted
    if event.origin is "{{ site.url }}"
        if event.data.hasOwnProperty "function"
            f = event.data.function
            window[f.name].apply(null, f.arguments || [])
            # console.log "A postMessage called a function"


window.addEventListener("message", onMessage, false) if window.addEventListener
window.attachEvent("onmessage", onMessage, false)    if window.attachEvent
