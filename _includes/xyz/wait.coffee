###
 * Returns a promise that resolves after a given number of milliseconds
 * @author MindfulMinun
 * @param {number} [ms] - Number of milliseconds
 * @returns {Promise} - Resolves after given ms
 * @since May 14, 2018
 * @version 1.0.0
###
xyz.wait = (ms) ->
    if not isFinite(ms) or Math.abs(ms) isnt ms
        throw new Error('Expected first argument `ms` to be a positive finite value.')
    return new Promise (resolve) ->
        window.setTimeout ->
            resolve()
            return
        , ms
