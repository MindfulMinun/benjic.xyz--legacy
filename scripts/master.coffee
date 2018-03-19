---
---
### =============================== ###
### ========== RandomInt ========== ###
### =============================== ###
#! Description: returns a random integer between <min> and <max>
#! Usage: Math.randomInt(<min>, <max>) OR
#!        Math.randomInt(<max>) where a number will be generated from 0 to <max> instead
Math.randomInt = (min, max) ->
    if arguments.length is 1
        max = min
        min = 0

    min = Math.ceil min
    max = Math.floor max
    return Math.floor(Math.random() * (max - min + 1)) + min


#! Random blobs
xyz.blobs =
    allBlobs: {{ site.data.blobs | jsonify }}
    pull: (index) ->
        # debugger
        x = if typeof index is "number"
                index
            else
                Math.randomInt(0, this.allBlobs.length - 1)

        selectedBlob = twemoji.parse this.allBlobs[x]
        return {blob: selectedBlob, index: x}

### ================================ ###
### ========== Parse HTML ========== ###
### ================================ ###
#! Description: Takes a string of HTML and parses in into an HTML node
#! Usage: xyz.parseHTML(<string>)
#! where string is a string representing HTML
#! Returns: Either an HTMLElement or an HTMLCollection, depending on the string
xyz.parseHTML = (string) ->
    tmp = document.implementation.createHTMLDocument()
    tmp.body.innerHTML = string
    if tmp.body.children.length is 1
        return tmp.body.firstChild
    else
        return tmp.body.children

### ================================= ###
### ========== Escape HTML ========== ###
### ================================= ###
#! Description: Sanitizes an an untrusted string with HTML characters.
#! Usage: xyz.escapeHTML(<String>)
#! Returns: a string with escaped HTML characters
xyz.escapeHTML = (string) ->
    _HTMLEntities =
        '&': '&amp;'
        '<': '&lt;'
        '>': '&gt;'
        '"': '&quot;'
        "'": '&#39;'
        '/': '&#x2F;'
        '`': '&#x60;'
        '=': '&#x3D;'
    String(string).replace /[&<>"'`=\/]/g, (s) -> _HTMLEntities[s]

### ============================ ###
### ========== Dialog ========== ###
### ============================ ###
xyz.dialog = {
    open: (qs) ->
        #! Usage: xyz.dialog.open(<qs>)
        #! where qs is a query selector identifying a marked up dialog
        #! It opens the dialog, if not already
        parent = document.querySelector qs
        parent.dataset.dialogState = "open"
    close: (qs) ->
        #! Usage: xyz.dialog.close(<qs>)
        #! where qs is a query selector identifying a marked up dialog
        #! It closes the dialog, if not already
        parent = document.querySelector qs
        parent.dataset.dialogState = "close"
}


### =========================== ###
### ========== Toast ========== ###
### =========================== ###
#! Usage: xyz.toast(<data>);
#! where data is an object with at least .content
#! It shows a toast in a container with an id of "toast-container"
xyz.toast = (data) ->
    if !data         then throw new Error "An object with content is required to display a toast"
    if !data.content then throw new Error "An object with content is required to display a toast"
    if !data.actionText && data.actionHandler then throw new Error "Provide a action text for the handler"

    toastContainer = document.getElementById "toast-container"
    if !toastContainer then throw new Error "There’s not a #toast-container on this page, you either forgot to add it or this page wasn’t built for toasts. Use banners instead."

    data.timeout = data.timeout or 4000
    data.actionHandler = data.actionHandler || `function(){}`


    thisToast = xyz.parseHTML """
        <div class="toast">
            <span class="toast-content">#{data.content}</span>
        </div>
    """
    if data.actionText
        thisToastButton = xyz.parseHTML """
            <button class="toast-action">#{data.actionText}</button>
        """
        thisToastButton.addEventListener "click", data.actionHandler
        thisToast.appendChild thisToastButton

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

### =========================== ###
### ========== Toast ========== ###
### =========================== ###
#! Description: Resolves after the desired number of milliseconds
#! Usage: xyz.wait(<ms>);
#! where ms the number of milliseconds to wait
#! Returns: a Promise
xyz.wait = (ms) ->
    return new Promise (resolve, reject) ->
        window.setTimeout ->
            resolve()
        , ms

### ======================================= ###
### ========== addEventListeners ========== ###
### ======================================= ###
#! Description: Adds event listeners to any number of nodes
#! Usage: xyz.addEventListeners(<nodes>, <event>, <handler>);
#! where <nodes> is an array-like object to add the event listeners to
#! where <event> is a string reperesenting the event name (such as "click")
#! where <handler> is the event handler to be fired
#! Returns: the nodes with the listers attached
xyz.addEventListeners = (nodes, event, handler) ->
    for node in nodes
        node.addEventListener event, handler
    return nodes

xyz.time = {
    timeFormatter: new Intl.DateTimeFormat([], {
        weekday: "short"
        hour: "numeric"
        minute: "2-digit"
    })
    format: (dateObj) -> @timeFormatter.format dateObj
}



xyz.ready(->
    #! Do nothing on "#!" links
    xyz.addEventListeners(
        document.querySelectorAll 'a[href="#!"], a[href="#"]',
        "click",
        (e) ->
            e.preventDefault()
            return false
    )
    #! Parse twemoji
    for el in document.getElementsByClassName 'e'
        el.innerHTML = twemoji.parse el.innerHTML;

    #! Send Acquisition, From share link when the URL is a share link
    if location.href.match(/\?[\s\S]*(s=(1|permalink))/gi)
        ga('send', 'event', 'Acquisition', "From share link")

    #! Add the footer blob if the footer's there
    if document.getElementById "footer--blob"
        document.getElementById "footer--blob"
        .innerHTML = xyz.blobs.pull().blob
)


onMessage = (event) ->
    #! Check sender origin to be trusted
    if event.origin is "{{ site.url }}"
        if event.data.hasOwnProperty "function"
            f = event.data.function
            window[f.name].apply(null, f.arguments || [])
            # console.log "Function was called via postMessage"

window.addEventListener("message", onMessage, false) if window.addEventListener
window.attachEvent("onmessage", onMessage, false)    if window.attachEvent
