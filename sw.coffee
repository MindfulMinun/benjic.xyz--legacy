---
---
'use strict'
assets = [
    # "https://www.google-analytics.com/analytics.js"
    "/styles/master.css"
    # "/styles/grid.css"
    "https://twemoji.maxcdn.com/2/twemoji.min.js?2.4"
]
# Cache name: v?.?.?-environment::yyyy-mm-dd--hh-mm-ss
CACHE_NAME = 'v0.0.0-production::2018-02-28--19:29:16'
expectedCaches = [
    CACHE_NAME
]

precache = (assetsToCache) ->
    caches.open(CACHE_NAME).then( (cache) ->
        cache.addAll(assets)
        .then(->
            l "Added assets to cache “#{CACHE_NAME}”"
        )
    )

retrieveFromCache = (request) ->
    caches.match request
    .then (matching) ->
        return matching || Promise.reject 'no-match'

deleteCachesNotIn = (arr) ->
    ###
     * Purpose: To delete old ServiceWorker caches.
     * Accepts: 1 argument, an array cache names *NOT* to delete
     * Returns: Nothing, this is a void function.
    ###
    caches.keys()
    .then (keylist) ->
        Promise.all (
            keylist.map (key) ->
                if arr.indexOf key is -1
                    caches.delete key
                    l "Deleted cache:", key
        )

l = ->
    ###
     * Prepends "ServiceWorker" in blue to console.log
     * Accepts: any amount of arguments.
     * Returns: Nothing, this is a void function.
    ###
    _ = [].slice.call arguments
    _.unshift '%cServiceWorker:', 'color:#448aff'
    console.log.apply null, _


self.addEventListener 'install', (event) ->
    l 'Installed successfully'
    event.waitUntil(
        precache assets
    )

self.addEventListener 'activate', (event) ->
    event.waitUntil(
        deleteCachesNotIn expectedCaches
    )


self.addEventListener 'fetch', (event) ->
    # Proxy only if it’s a GET request
    if event.request.method is "GET"
        event.respondWith(
            caches.match event.request
            .then (response) ->
                if response
                    event.waitUntil caches.open(CACHE_NAME).add(event.request)
                    return response
                else
                    return fetch event.request
        )
