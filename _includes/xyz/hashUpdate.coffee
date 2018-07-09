###*
 * Calls a function every time the url hash is updated
 * @author MindfulMinun
 * @param {function} [cb] - Your callback to be fired
 * @since May 20, 2018
 * @version 1.0.0
###
xyz.hashUpdate = (cb) ->
    window.addEventListener 'hashchange', ->
        cb location.hash
    #! Note that the callback is called immediately after adding the listener.
    cb location.hash
    return
