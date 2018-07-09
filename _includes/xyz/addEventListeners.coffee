###*
 * Adds event listeners to an array of nodes or `EventTarget`s.
 * @author MindfulMinun
 * @param {Array} [nodes] - An array of elements to attach listeners to
 * @param {string} [event] - The event to listen for, such as "click"
 * @param {function} [handler] - The event handler
 * @returns {Array} - The given nodes with the listeners attached
 * @since May 14, 2018
 * @version 1.0.0
###
xyz.addEventListeners = (nodes, events, handler) ->
    if Array.isArray events
        for node in nodes
            for event in events
                node.addEventListener event, handler
    else
    for node in nodes
        node.addEventListener events, handler
    return nodes
