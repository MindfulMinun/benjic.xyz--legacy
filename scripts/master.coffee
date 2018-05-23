---
---
'use strict'

{% include_relative xyz/randomInt.coffee %}
{% include_relative xyz/parseHTML.coffee %}
{% include_relative xyz/escapeHTML.coffee %}
{% include_relative xyz/wait.coffee %}
{% include_relative xyz/addEventListeners.coffee %}

#! Random blobs
xyz.blobs = {
    allBlobs: {{ site.data.blobs | jsonify }}
    pull: (index) ->
        x = if typeof index is "number"
                index
            else
                xyz.randomInt(0, @allBlobs.length - 1)

        return {
            blob: twemoji.parse @allBlobs[x]
            index: x
        }
}

##! ============================ !##
##! ========== Dialog ========== !##
##! ============================ !##
xyz.dialog = {
    open: (qs) ->
        #! Usage: xyz.dialog.open(<qs>)
        #! where qs is a query selector identifying a marked up dialog
        #! It opens the dialog, if not already
        document.querySelector qs
        .dataset.dialogState = "open"
    close: (qs) ->
        #! Usage: xyz.dialog.close(<qs>)
        #! where qs is a query selector identifying a marked up dialog
        #! It closes the dialog, if not already
        document.querySelector qs
        .dataset.dialogState = "close"
}


##! =========================== !##
##! ========== Toast ========== !##
##! =========================== !##
#! Usage: xyz.toast(<data>);
#! where data is an object with at least .content
#! It shows a toast in a container with an id of "toast-container"
xyz.toast = (data) ->
    if !data         then throw new Error "An object with content is required to display a toast"
    if !data.content then throw new Error "An object with content is required to display a toast"
    if !data.actionText && data.actionHandler then throw new Error "Provide a action text for the handler"

    toastContainer = document.getElementById "toast-container"
    if !toastContainer then throw new Error "There’s not a #toast-container on this page, you either forgot to add it or this page wasn’t built for toasts."

    data.timeout = data.timeout or 4000
    data.actionHandler = data.actionHandler || ( -> )


    thisToast = xyz.parseHTML """
        <div class="toast">
            <span class="toast-content">#{data.content}</span>
        </div>
    """
    if data.actionText
        toastButton = xyz.parseHTML """
            <button class="toast-action">#{data.actionText}</button>
        """
        toastButton.addEventListener "click", data.actionHandler
        thisToast.appendChild toastButton

    toastContainer.appendChild thisToast
    #! Add the "showing" class after the toast is rendered to start the transition
    requestAnimationFrame ->
        requestAnimationFrame ->
            thisToast.classList.add "showing"
            #! Show the toast for <timeout> milliseconds, then kill it
            xyz.wait data.timeout
            .then ->
                thisToast.classList.remove "showing"

    #! Listen for the transitionend event to get rid of the toast
    thisToast.addEventListener "transitionend", (e) ->
        if (not thisToast.classList.contains "showing") and e.propertyName is "opacity"
            thisToast.parentNode.removeChild thisToast
    return data

xyz.ready(->
    #! Parse twemoji
    for el in document.getElementsByClassName 'e'
        el.innerHTML = twemoji.parse el.innerHTML;

    #! Send Acquisition, From share link when the URL is a share link
    if location.href.match(/\?[\s\S]*(s=(1|permalink))/gi)
        ga('send', 'event', 'Acquisition', "From share link")

    #! Add the footer blob if the footer's there
    footerBlob = document.getElementById "footer--blob"
    if footerBlob then footerBlob.innerHTML = xyz.blobs.pull().blob
)

xyz.addEventListeners([window], 'message', (event) ->
    #! Check sender origin to be trusted
    if event.origin is "{{ site.url }}"
        if event.data.hasOwnProperty "function"
            f = event.data.function
            window[f.name].apply(null, f.arguments || [])
            # console.log "Function was called via postMessage"
)
