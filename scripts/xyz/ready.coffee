###*
 * Invokes function once DOM is ready
 * @author MindfulMinun
 * @param {function} [f] - Function to be invoked once document has been loaded.
 * @since May 14, 2018
 * @version 1.0.0
###
xyz.ready = (f) ->
    if (
        if document.attachEvent then (document.readyState is "complete") else (document.readyState isnt "loading")
    )
        f()
    else
        document.addEventListener "DOMContentLoaded", f
