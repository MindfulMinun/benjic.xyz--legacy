###*
 * Escapes HTML entities for safe usage in innerHTML
 * @author MindfulMinun
 * @param {string} [string] - The string with HTML entities to be escaped
 * @returns {string} - The escaped string
 * @since Around Jan 2018
 * @version 1.0.0
###
xyz.escapeHTML = (string) ->
    if typeof string isnt "string"
        throw new Error "Expected first argument `string` to be of type string."
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
