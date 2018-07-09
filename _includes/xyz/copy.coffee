###
 * Copies arbitary text to the clipboard.
###

xyz.copy = (text) ->
    new Promise((resolve, reject) ->
        try
            #! Use async `navigator.clipboard`
            navigator.clipboard.writeText text
            .then ->
                #! Copied to clipboard successfully.
                resolve()
            .catch (err) ->
                #! Couldn't copy to clipboard.
                reject error
        catch error
            #! document.execCommand as fallback.
            prevFocus = document.activeElement
            copyTextarea = document.createElement "textarea"
            copyTextarea.value = text
            copyTextarea.style = "position:absolute;left:-9999px;"
            document.body.appendChild copyTextarea
            copyTextarea.focus()
            copyTextarea.select()
            try
                successful = document.execCommand('copy')
                prevFocus.focus()
                copyTextarea.parentNode.removeChild(copyTextarea)
                if successful then resolve() else reject()
            catch error
                copyTextarea.parentNode.removeChild(copyTextarea)
                prevFocus.focus()
                reject error
    )
