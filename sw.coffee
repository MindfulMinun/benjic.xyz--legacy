---
---
'use strict'
offline_url = "/oops/offline.html"
assets = [
    # "https://www.google-analytics.com/analytics.js"
    "/styles/master.css"
    "/scripts/mini-video.js"
    offline_url
    # "/styles/grid.css"
    "https://twemoji.maxcdn.com/2/twemoji.min.js?2.5"
]
# Cache name: v?.?.?-environment::yyyy-mm-dd--hh-mm-ss
# Current_Cache = 'v0.0.0-production::2018-03-17--23:49:26'
Current_Cache = 'v1.0.0-production::2018-05-23--13:31:01'
expectedCaches = [
    Current_Cache
]

precache = (assetsToCache) ->
    ###
     * Purpose: To add assets to the cache so they can be retrieved later
     * Accepts: 1 argument, a list of URLs to add to the cache
     * Returns: A promise
    ###
    caches.open Current_Cache
    .then (cache) ->
        cache.addAll assetsToCache

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
                if arr.indexOf(key) is -1
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
        .then ->
            l "Added assets to cache “#{Current_Cache}”"
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
                if response #! If there's something in the cache, use that and update the cache.
                    event.waitUntil(
                        caches.open Current_Cache
                        .then (cache) ->
                            cache.add event.request
                    )
                    return response
                else if (event.request.mode is "navigate") or event.request.headers.get("accept").includes("text/html")
                    #! If it’s not in the cache and we're requesting an HTML file, try that with the offline fallback
                    fetch(event.request).catch -> caches.match offline_url
                else
                    #! If all else fails, just hit the network and hope for the best.
                    fetch event.request
        )
