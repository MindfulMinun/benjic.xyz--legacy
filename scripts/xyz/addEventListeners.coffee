###*
 * Adds event listeners to an array of nodes
 * @author MindfulMinun
 * @param {Array} [nodes] - An array of elements to attach listeners to
 * @param {string} [event] - The event to listen for, such as "click"
 * @param {function} [handler] - The event handler
 * @returns {Array} - The given nodes with the listeners attached
 * @since May 14, 2018
 * @version 1.0.0
###
xyz.addEventListeners = (nodes, event, handler) ->
    for node in nodes
        if node.addEventListener
            node.addEventListener event, handler
        else
            node.attachEvent 'on' + event, handler
    return nodes
