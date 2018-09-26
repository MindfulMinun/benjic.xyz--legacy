---
layout: content-only
title: Un videojuego de texto
document_title: Un videojuego de texto
description: >
    Encuentras un videojuego de texto. Después de jugar un rato,
    miras a tu alrededor, y te encuentras entre la obscuridad.
    ¿Podrás escapar?
lang: "es-MX"
theme-color: "#0F0"
afterHead: <link rel="stylesheet" href="/p/a-text-based-game/game/game.css">
scripts:
    - src: /p/a-text-based-game/game/H.js
    - src: /p/a-text-based-game/game/es.js
    - content: >
        H.choice({
            choices: [{
                content: "Comenzar",
                callback: function () {
                    es.$1().then(function () {
                        console.log("Vaya, se terminó el juego. Qué raro.");
                    }).catch(function () {
                        H.out("Se produjo un error, espero que Monika to tiene nada que ver.")
                    })
                }
            }]
        })
---

<header class="header">
    <a class="back" id="back"
        href="/p/a-text-based-game/"
        title="Regresar a la página del juego."
        aria-label="Regresar a la página del juego.">
        <i class="material-icons">chevron_left</i>
    </a>
</header>


<div id="terminal" class="terminal" aria-live="polite">
    <noscript class="terminal--line" style="text-indent: 0; padding-left: 0;">
        Basta ya de chistes e habilita JavaScript.
    </noscript>
</div>
