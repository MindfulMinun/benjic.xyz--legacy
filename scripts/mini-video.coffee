---
---
##! ======================================= !##
##! ========== Tiny video player ========== !##
##! ======================================= !##

'use strict'

dataState = 'data-playback-state'
dataStarted = 'data-started'

# UI = {
#     prep: "Preparing video."
#     notRes: "Video not resumed. Click to play."
#     ready: "Video ready. Click to play."
#     playing: "Playing. Click to pause."
#     paused: "Paused. Click to play."
#     ended: "Playback ended. Click to replay."
#     buffer: "Buffering video. Please wait."
#     notLoading: "Video not loading. Click to retry."
# }
UI = {
    prep: "Preparando el video."
    notRes: "Error al reanudar video. Clic para reproducir."
    ready: "Video listo. Reproducir."
    playing: "Reproduciendo. Clic para pausar."
    paused: "Pausado. Clic para reproducir."
    ended: "Fin del video. Clic para repetir."
    buffer: "Cargando video."
    notLoading: "Fallo al cargar el video. Clic para reintentar."
}


createPlayer = (p) ->
    v = p.getElementsByTagName('video')[0]
    b = p.getElementsByTagName('button')[0]
    v.setAttribute 'aria-hidden', yes

    #! Event listeners
    #! Click listener
    p.addEventListener 'click', ->
        if p.getAttribute 'data-click-action' is 'load'
            v.load()
            b.innerHTML = UI.prep
            return
        if v.paused and p.getAttribute dataState
            v.play().catch ->
                b.innerHTML = UI.notRes
        else
            v.pause()

    #! Video listeners
    v.addEventListener 'canplay', ->
        p.setAttribute dataState, 'ready'
        b.innerHTML = UI.ready

    # v.addEventListener 'timeupdate', ->
    #     #! I’d update the UI here, but there is none

    v.addEventListener 'playing', ->
        p.setAttribute dataState, 'playing'
        b.innerHTML = UI.playing
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
        b.innerHTML = UI.paused

    v.addEventListener 'ended', ->
        p.setAttribute dataState, 'stopped'
        b.innerHTML = UI.ended
        window.parent.postMessage {
            "function": {
                "name": "ga"
                "arguments": ['send', 'event', 'Media', 'Video played to end']
            }
        }, "*"

    v.addEventListener 'waiting', ->
        p.setAttribute dataState, 'loading'
        b.innerHTML = UI.buffer

    v.addEventListener 'stalled', ->
        console.log 'Video stalled.'
        b.innerHTML = UI.notLoading
        p.setAttribute dataState, 'loading'
        p.setAttribute 'data-click-action', 'load'

players = document.getElementsByClassName 'tiny-video-player'
createPlayer player for player in players
