###*
 * Converts an HTML-formatted string to HTML nodes
 * @author MindfulMinun
 * @param {string} [string] - HTML-formatted string
 * @returns {(HTMLElement|HTMLCollection)} - The element(s)
 * @since Around Jan 2018
 * @version 1.0.0
###
xyz.parseHTML = (string) ->
    tmp = document.implementation.createHTMLDocument()
    tmp.body.innerHTML = string
    if tmp.body.childNodes.length is 1
        return tmp.body.firstChild
    else
        return tmp.body.childNodes
