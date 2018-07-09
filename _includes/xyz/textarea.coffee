###*
 * Makes textareas autoresize.
###
xyz.textarea = {
    upgrade: (el) ->
        el.addEventListener 'input', ->
            this.style.height = "auto"
            this.style.height = "#{this.scrollHeight + 1}px"
    update: (el) ->
        el.style.height = "auto"
        el.style.height = "#{el.scrollHeight + 1}px"
}
xyz.ready ->
    for txt in document.querySelectorAll 'textarea.textarea'
        xyz.textarea.upgrade txt
