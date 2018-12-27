---
---
'use strict'

#! coffeelint: disable=space_operators
{% capture scss %}
@import "_vars";
// Audio player styles ###
.audio-player {
    overflow: hidden;
    background-color: #fff;
    color: #000;
    border: 1px solid rgba(black, 0.13);
    padding: 8px;
    display: flex;
    flex-direction: row;
    align-items: center;

    .audio-player__content {
        flex: 1;
        padding: 0.5rem 1rem;
        color: #727272;
        transition: color 0.2s $standard-curve;
        border-left: 1px solid rgba(black, 0.13);
        &:hover {color: #212121;}
        .title {display: block;}
        .song-data {display: block; font-size: 0.75em;}
        * {margin: 0;}
    }

    .audio-player__icon {
        font-size: 1.3em; vertical-align: middle;
    }

    .audio-player__controls {
        order: -1;
        padding-right: 8px;
        display: flex;
        flex-direction: row;
        align-items: center;

        .audio-player__time-display {
            font-size: 12px;
            width: auto; border-radius: 4px;
            color: #424242;
            cursor: default;
            &:active, &:hover, &:focus {color: #424242;}
        }
        button {
            transition: color      0.2s $standard-curve,
                        opacity    0.2s $standard-curve,
                        background 0.2s $standard-curve;
            margin-right: 8px;
            font-family: inherit;
            background: 0; border: 0;
            height: 40px; width: 40px;
            outline: 0; border-radius: 50%;
            cursor: pointer;
            color: #000; opacity: 0.52;

            &:hover, &:focus {background-color: rgba(black, 0.13);}
            &:active {opacity: 1;}

            i.material-icons {position: relative; right: 0px; top: 2px;}
        }
    }
}
// ###
{% endcapture %}
#! coffeelint: enable=space_operators

styles = "{{ scss | scssify }}"


#! Append styles
css = document.createElement "style"
css.type = "text/css"
css.innerHTML = styles
document.head.appendChild css


# Audio will start up with markup like this:
# <div class="audio-player" hidden>
#     <audio>
#         <source src="https://puu.sh/zbJs6/b42155aac9.mp3" type="audio/mpeg">
#     </audio>
#     <div class="audio-player__content">
#         <span class="title">Don’t Ever Forget</span>
#         <span class="song-data">Arata Iiyoshi &mdash; Pokémon Mystery Dungeon: Explorers of Time &amp; Darkness</span>
#     </div>
# </div>
#
# And should end up with markup like this, just appending __controls:
# <div class="audio-player" hidden>
#     <audio>
#         <source src="https://puu.sh/zbJs6/b42155aac9.mp3" type="audio/mpeg">
#     </audio>
#     <div class="audio-player__content">
#         <span class="title">Don’t Ever Forget</span>
#         <span class="song-data">Arata Iiyoshi &mdash; Pokémon Mystery Dungeon: Explorers of Time &amp; Darkness</span>
#     </div>
#     <div class="audio-player__controls">
#         <button aria-label="Play"><i class="material-icons">play_arrow</i></button>
#         <button class="audio-player__time-display">0:00 / ?:??</button>
#     </div>
# </div>

formatTime = (timeInSec) ->
    hrs  = ~~(timeInSec / 3600)
    mins = ~~((timeInSec % 3600) / 60)
    secs = ~~(timeInSec % 60)
    ret  = ""

    if hrs > 0
        ret += hrs + ":" + (if mins < 10 then "0" else "")
    ret += mins + ":" + (if secs < 10 then "0" else "")
    ret += secs
    return ret


createPlayer = (box) ->
    box.appendChild xyz.parseHTML "
        <div class=\"audio-player__controls\">
            <button aria-label=\"Play\">
                <i class=\"material-icons\">play_arrow</i>
            </button>
            <button class=\"audio-player__time-display\"
                aria-label=\"Timestamp not loaded.\">0:00 / ?:??</button>
        </div>
    "

    player = box.querySelector 'audio'
    pp = box.querySelector 'button'
    timeDisplay = box.querySelector ".audio-player__time-display"

    box.removeAttribute "hidden"

    updateTime = ->
        timeDisplay.setAttribute(
            "aria-label",
            "#{formatTime player.currentTime} out of
            #{formatTime player.duration}"
        )
        timeDisplay.textContent = "
            #{formatTime player.currentTime} / #{formatTime player.duration}
        "

    #! Set initial states
    box.dataset.playbackState = 'unstarted'

    #! Button listener
    pp.addEventListener 'click', ->
        if player.paused
            player.play()
            .catch ->
            pp.setAttribute "aria-label", "Playback not resumed. Click to play."
        else
            player.pause()

    #! Audio listeners
    player.addEventListener 'playing', ->
        #! Analytics
        if box.dataset.playbackState is "unstarted"
            ga?('send', 'event', 'Media', "Audio played")
        box.dataset.playbackState = 'playing'
        pp.setAttribute "aria-label", "Playing. Click to Pause."
        pp.innerHTML = "<i class=\"material-icons\">pause</i>"
    player.addEventListener 'pause', ->
        box.dataset.playbackState = 'pause'
        pp.setAttribute "aria-label", "Paused. Click to Play."
        pp.innerHTML = "<i class=\"material-icons\">play_arrow</i>"
    player.addEventListener 'ended', ->
        box.dataset.playbackState = 'end'
        pp.setAttribute "aria-label", "Playback ended. Click to restart."
        #! Analytics
        ga?('send', 'event', 'Media', "Audio played to end")
    player.addEventListener 'waiting', ->
        box.dataset.playbackState = "buffering"
        pp.setAttribute "aria-label", "Loading..."

    # player.addEventListener "timeupdate", updateTime
    # player.addEventListener "loadedmetadata", updateTime
    # player.addEventListener "durationchange", updateTime
    xyz.addEventListeners(
        [player],
        ["timeupdate", "loadedmetadata", "durationchange"],
        updateTime
    )

players = document.querySelectorAll '.audio-player'
createPlayer player for player in players
