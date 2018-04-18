---
---
'use strict'
## ==================================== ##
## ========== Time Formatter ========== ##
## ==================================== ##
(->
    if Intl?.DateTimeFormat?
        timeEls = document.querySelectorAll 'time[datetime].i18n'

        setTime = (timeElement) ->
            date = new Date timeElement.getAttribute 'datetime'
            dateTimeFormatter = new Intl.DateTimeFormat [], {
                weekday: 'short'
                month: 'short'
                day: 'numeric'
                hour: 'numeric'
                minute: 'numeric'
            }
            timeElement.innerText = dateTimeFormatter
                .format date
                .replace /[AP]\.?M/g, (match) -> match.toLowerCase()

        setTime element for element in timeEls

)()
((id) ->
    ##! ================================== !##
    ##! ========== Share Button ========== !##
    ##! ================================== !##
    btn   = document.getElementById id
    title = document.querySelector 'meta[name="post:title"]'
            .getAttribute 'content'
    text  = document.querySelector 'meta[name="post:share-text"]'
            .getAttribute 'content'

    btn.addEventListener 'click', ->
        url = document.querySelector 'meta[name="post:permalink"]'
                .getAttribute('content') + location.hash + "?s=1"
        if navigator.share
            navigator.share {
                title, text, url
            }
            .then ->
                #! Successful share
                # alert 'Shared successfully'
                ga('send', 'event', 'Share', 'Shared w/ Web Share API')
            .catch (err) ->
                alert 'Error, couldn’t share'
                console.error err
        else
            prompt 'Permalink:', url
            ga('send', 'event', 'Share', 'Shared Permalink')


)('share')

##! ================================== !##
##! ========== Header links ========== !##
##! ================================== !##
((CSSHeadersSelector) ->
    headers = document.querySelector 'article.post-content'
        .querySelectorAll CSSHeadersSelector
    wrapLink = (el) ->
        anchor = document.createElement 'a'
        clone  = el.cloneNode true

        #! Set the anchor's attributes
        anchor.href = '#' + el.id
        anchor.classList.add 'header-link'
        #! Insert the clone
        anchor.appendChild clone

        #! Add some event listeners
        # anchor.addEventListener 'click', (event) -> event

        #! Insert the anchor and clone.
        #!     Signature: <parentNode>.insertBefore(<newNode>, <referenceNode>)
        el.parentElement.insertBefore anchor, el
        #! Finally, delete the element
        el.parentElement.removeChild el

    wrapLink header for header in headers

)('h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]')
