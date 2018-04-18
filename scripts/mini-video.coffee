---
---
##! ======================================= !##
##! ========== Tiny video player ========== !##
##! ======================================= !##

'use strict'

dataState = 'data-playback-state'
dataStarted = 'data-started'

createPlayer = (p) ->
    v = p.getElementsByTagName('video')[0]
    # b = document.createElement 'button'
    b = p.getElementsByTagName('button')[0]
    v.setAttribute 'aria-hidden', yes
    # b.classList.add 'mini-video-player__a11y-btn'
    # b.setAttribute 'aria-live', 'polite'
    # p.appendChild b

    #! Event listeners
    #! Click listener
    p.addEventListener 'click', ->
        if p.getAttribute 'data-click-action' is 'load'
            v.load()
            b.innerText = 'Preparing video.';
            return;
        if v.paused and p.getAttribute dataState
            v.play().catch ->
                b.innerText = 'Video not resumed. Click to play.'
        else
            v.pause()

    #! Video listeners
    v.addEventListener 'canplay', ->
        p.setAttribute dataState, 'ready'
        b.innerText = 'Video ready. Click to play.'

    # v.addEventListener 'timeupdate', ->
    #     #! I’d update the UI here, but there is none

    v.addEventListener 'playing', ->
        p.setAttribute dataState, 'playing'
        b.innerText = 'Playing. Click to pause.'
        if not p.getAttribute dataStarted
            window.parent.postMessage {
                "function": {
                    "name": "ga"
                    "arguments": ['send', 'event', 'Media', 'Video played']
                }
            }, "*"
            p.setAttribute dataStarted, yes

    v.addEventListener 'pause', ->
        p.setAttribute dataState, 'paused'
        b.innerText = 'Paused. Click to play.'

    v.addEventListener 'ended', ->
        p.setAttribute dataState, 'stopped'
        b.innerText = 'Playback ended. Click to play.'
        window.parent.postMessage {
            "function": {
                "name": "ga"
                "arguments": ['send', 'event', 'Media', 'Video played to end']
            }
        }, "*"

    v.addEventListener 'waiting', ->
        p.setAttribute dataState, 'loading'
        b.innerText = 'loading'

    v.addEventListener 'stalled', ->
        console.log 'Video stalled.'
        b.innerText = 'Video not loading. Click to force reload.'
        p.setAttribute dataState, 'loading'
        p.setAttribute 'data-click-action', 'load'

players = document.getElementsByClassName 'tiny-video-player'
createPlayer player for player in players
