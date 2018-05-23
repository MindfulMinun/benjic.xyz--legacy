###*
 * Generates a random integer between min and max
 * @author MindfulMinun
 * @param {number} [min] - Minimum number to gen from
 * @param {number} [max] - Maximum number to gen from
 * @returns {number} - A random number between min and max
 * @since January 2018
###
xyz.randomInt = (min, max) ->
    if arguments.length is 1
        max = min
        min = 0

    return Math.floor(Math.random() * (~~max - ~~min + 1)) + ~~min
