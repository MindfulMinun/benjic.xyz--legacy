---
---
#! ========================================
#! ServiceWorker

#! Constants
CACHE = '{{ site.environment }}::{{ site.time | slice: 0, 19 }}'
OFFLINE = "/oops/offline.html"
ASSETS = [
    #! Criticals
    "/styles/master.css"
    "/scripts/master.js"
    "/scripts/post.js"
    "/scripts/mini-video.js"
    "/scripts/focus-visible.js"
    #! SVGs
    "/assets/svg/cloud_circle--white.svg"
    "/assets/svg/hash.svg"
    "/assets/svg/pause_circle_filled--white.svg"
    "/assets/svg/pause--black.svg"
    "/assets/svg/play_arrow--black.svg"
    "/assets/svg/play_circle_filled--white.svg"
    #! Offline
    OFFLINE
    #! External
    "https://twemoji.maxcdn.com/2/twemoji.min.js?2.5"
]

#! ========================================
#! Log helper: Prepends "ServiceWorker" in blue to console.log
l = ->
    _ = [].slice.call arguments
    _.unshift '%cServiceWorker:', 'color:#448aff'
    console.log.apply null, _

#! ========================================
#! Precache: precaches the assets for later
precache = (assets) ->
    caches.open CACHE
        .then (cache) ->
            cache.addAll assets

#! ========================================
#! FromNetwork: Fetches asset from the network or rejects if it takes too long.
fromNetwork = (request, timeout) ->
    new Promise (fulfill, reject) ->
        t = setTimeout(reject, timeout)
        fetch(request)
        .then (response) ->
            clearTimeout(t)
            fulfill(response)
        .catch reject

#! ========================================
#! FromCache: Fetches asset from the cache.
fromCache = (request) ->
    caches.open(CACHE)
    .then (cache) ->
        cache.match request
            #! Resolves with `undefined` if no match
            .then (matching) -> matching or Promise.reject('no-match')
            #! Resolves with the offline url if no match
            # .then (matching) -> matching or cache.match OFFLINE

#! ========================================
#! Install: precaches assets
self.addEventListener "install", (e) ->
    l "Installing: #{CACHE}"
    e.waitUntil precache ASSETS


#! ========================================
#! Fetch: Goes to the network, but if it's taking too long,
#!        it fetches from the cache
self.addEventListener "fetch", (e) ->
    #{% if site.environment == "development" %}
    url = new URL e.request.url
    l "Fetch:", url
    #{% endif %}

    e.respondWith(
        #! Here's what this does:
        #! - Try to fetch from network quickly...
        #! - If it takes too long, go to cache
        #! - If not in cache, go to network again.
        #! - If all of that failed, assume no network; offline
        fromNetwork(e.request, 400)
        .catch -> fromCache(e.request)
        .catch -> fetch(e.request)
        .catch -> caches.match(OFFLINE) if e.request.method is 'GET'
    )

#! ========================================
#! Activate: Delete previous caches
self.addEventListener "activate", (e) ->
    dontdelete = [
        CACHE
    ]
    e.waitUntil(
        caches.keys()
        .then (keylist) ->
            Promise.all(
                keylist.map (key) ->
                    if dontdelete.indexOf(key) is -1
                        caches.delete(key)
                        l "Deleted cache:", key
            )
    )
