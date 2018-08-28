---
layout: content-only
title: A text-based game
document_title: A text-based game
description: >
    You stumble upon a text-based game. After playing it a bit,
    you look around, finding yourself amidst the darkness.
    Can you escape?
theme-color: "#0F0"
afterHead: <link rel="stylesheet" href="/p/a-text-based-game/game/game.css">
scripts:
    - src: /p/a-text-based-game/game/H.js
    - src: /p/a-text-based-game/game/en.js
    - content: >
        H.choice({
            choices: [{
                content: "Start",
                callback: function () {
                    en.$1().then(function () {
                        console.log("Dang, the game ended. That’s weird.");
                    }).catch(function () {
                        H.out("An error occurred, I hope Monika has nothing to do with this.")
                    })
                }
            }]
        })
---

<header class="header">
    <a class="back" id="back"
        href="/p/a-text-based-game/"
        title="Back to game page"
        aria-label="Back to game page">
        <i class="material-icons">chevron_left</i>
    </a>
</header>


<div id="terminal" class="terminal" aria-live="assertive">
    <noscript class="terminal--line" style="text-indent: 0; padding-left: 0;">
        Quit being paranoid and enable JavaScript.
    </noscript>
</div>
