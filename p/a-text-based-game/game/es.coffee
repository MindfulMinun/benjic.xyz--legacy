---
---
# Un videojuego de texto

#! ========================================
#! Game State + Chapters
G = window.es = {}
G.state =
    # "Des pier ta"
    wa: no
    hasEnded: no
#! Chapters
G.$1 = ->
    #! Game 1
    H.thenChain()
    .then -> H.out 'Encuentras un videojuego de texto.'
    .then -> H.out 'Es obvio que menos de 24 horas se han
        dedicado en hacerlo.', 3
    .then -> H.newLine 3
    .then -> H.choice({
        content: '¿Deseas jugar el juego?'
        choices: [{
            content: 'Sí'
            callback: ->
                H.out "Decides iniciar el juego."
        }, {
            content: 'No'
            callback: ->
                H.out "No te parece interesante, pero la curiosidad
                    te obliga a jugarlo."
        }]
    })
    .then -> H.out "El juego comienza con una pantalla que dice:", 3
    .then -> H.out '“Encuentras un videojuego de texto.”', 3
    .then -> H.out "Sientes haber visto algo así antes.", 3
    .then -> H.out '“Es obvio que menos de 24 horas se han
        dedicado en hacerlo.”', 3
    .then -> H.newLine 3
    .then -> H.choice {
        content: "¿Qué decides hacer?"
        choices: [{
            content: "Jugar"
            callback: -> G.$1()
        }, {
            content: "Examinar"
            callback: -> G.$2()
        }]
    }
G.$2 = ->
    #! Game 2
    H.thenChain()
    .then -> H.out 'Miras a tu alrededor.'
    .then -> H.out "Apenas hay suficiente luz para ver
        casi 3 metros y medio.", 3
    .then -> H.out "Este lugar te suena.", 3
    .then -> H.newLine 3
    .then -> H.choice {
        content: '¿Qué decides hacer?'
        choices: [{
            content: "Examinar"
            callback: -> G.$2_investigate()
        },{
            content: "Vagar"
            callback: ->
                H.out '...'
                G.$3()
        }]
    }
G.$2_investigate = ->
    H.thenChain()
    .then -> H.out 'Al mirar por la habitación, te das cuenta de que
        es bastante amplia.'
    .then -> H.out 'Una de las paredes está hecha de vitral.', 3
    .then -> H.out 'Más allá del vitral, no hay más que un abismo.', 3
    .then -> H.out 'Hay varias mesas y sillas que llenan el
        centro de la habitación.', 3
    .then -> H.out 'Están alineadas con esmero, y no han sido tocadas.', 3
    .then -> H.newLine 6
    .then -> H.out 'Notas que hay un papel en el suelo cercas de ti.'
    .then -> H.newLine 3
    .then -> H.choice {
        content: "¿Qué decides hacer con el papel?"
        choices: [{
            content: "Leer"
            callback: -> G.wa()
        }, {
            content: "Abandonar"
            callback: ->
                H.out 'Abandonas el papel y comienzas a deambular.'
                G.$3()
        }]
    }
G.$3 = ->
    #! Chapter 3
    # console.log "G.$3"
    H.thenChain()
    .then -> H.out 'Después de vagar un poco, te das cuenta de algo.', 10
    .then -> H.out 'Parece que la oscuridad se haya acercado.', 3
    .then -> H.out 'Tu vista se encoge, es sumamente difícil ver.', 10
    .then -> H.out 'Pero sigues andando.', 10
    .then -> H.newLine(3)
    .then -> H.out 'Estás perdido.'
    .then -> H.out 'Mientras andabas, notaste que esto es
        alguna clase de escuela.', 3
    .then -> H.out 'A lo largo de los pasillos, hay salones
        llenos de pupitres.', 3
    # .then -> H.out '', n
    .then -> H.choice {
        content: '¿Deseas entrar en uno de los salones de clases?'
        choices: [{
            content: 'Sí'
            callback: -> G.$3_classroom()
        }, {
            content: 'No'
            callback: ->
                H.thenChain()
                .then -> H.out 'Decides seguir andando.'
        }]
    }
    .then -> H.newLine(10)
    .then -> H.out 'Ya te cansaste de caminar.'
    .then -> H.out 'No se puede ver más que medio metro
        en cualquier dirección.', 3
    .then -> H.out 'Pero sigues andando.', 3
    .then -> H.newLine(10)
    .then -> H.out 'Ya no puedes ver, vas casi a ciegas.'
    .then -> H.out 'Estás cansado, pero no puedes dormir.', 3
    .then -> H.out 'Ya no puedes sentir los pies.', 3
    .then -> H.out 'Pero sigues andando.', 3
    .then -> H.newLine(10)
    .then -> H.out 'De repente,'
    .then -> H.wait(3)
    .then -> G.badend()
G.$3_classroom = ->
    chance = H.random(0, 1)
    if chance
        if G.state.wa is true
            H.thenChain()
            .then -> H.newLine()
            .then -> H.out 'Al entrar al salón de clases,'
            .then -> H.wait 3
            .then -> G.badend()
        else
            H.thenChain()
            .then -> H.newLine()
            .then -> H.out 'Al entrar al salón de clases,'
            .then -> H.out 'Caes inconsciente.', 3
            .then -> H.newLine(10)
            .then -> H.out 'Despiertas en el suelo.'
            .then -> H.out 'Junto a ti hay un papel.', 3
            .then -> H.newLine(3)
            .then -> H.choice({
                content: "¿Qué decides hacer con el papel?"
                choices: [{
                    content: "Leer"
                    callback: -> G.wa()
                }, {
                    content: "Abandonar"
                    callback: -> # Resolve.
                }]
            })
            .then -> H.newLine()
            .then -> H.out 'Te pones de pié e intentas huir del salón.'
            .then -> H.out 'La puerta no abre.', 3
            .then -> H.out 'No hay modo, estás atrapado aquí.', 5
            .then -> H.out 'Volteas a ver el sitio donde te despertaste..', 3
            .then -> H.out 'El papel ya no está.', 5
            .then -> H.out 'Tu vista se hace más y más oscura.', 3
            .then -> H.out 'Intentas buscar una manera por cual escapar.', 3
            .then -> H.newLine(10)
            .then -> H.out 'De repente,'
            .then -> H.wait 3
            .then -> G.badend()
    else
        H.thenChain()
        .then -> H.newLine()
        .then -> H.out 'Al entrar al salón de clases,'
        .then -> H.wait 3
        .then -> G.badend()
G.wa = ->
    #! Game WA
    G.state.wa = true
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Recoges el papel y empiezas a leerlo.'
    .then -> H.out 'En él, hay tres letras y el esbozo de una mapa.', 3
    .then -> H.out 'Las letras son “DES”.', 3
    .then -> H.out 'La mapa se semeja a la habitación en la que estás.', 3
    .then -> H.out 'Arriba de la mapa hay una etiqueta.', 3
    .then -> H.out 'La etiqueta está manchada, y la oscuridad
        tampoco te deja leerla.', 3
    .then -> H.out 'Lo único que se entiende es “cy҉ ͏ ̷r̢ ̛ f̡ ̢”.', 3
    .then -> H.out 'La mapa también muestra que hay una
        habitación cerca, la cual está conectada con un pasillo largo.', 3
    .then -> H.out 'Esa habitación también tiene una etiqueta,
        pero sólo dice “ųl҉ ̕p̨e҉ ”.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "¿Adónde decides ir?"
        choices: [{
            content: "A la habitación"
            callback: ->
                G.wa_room()
        }, {
            content: "Al pasillo"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'Entras al pasillo y vagas sin rumbo.'
                .then -> H.wait 3
                .then -> G.$3()
        }]
    })
G.wa_room = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Al entrar por el pasillo, la oscuridad se
        acerca poco a poco.'
    .then -> H.out 'Solo puedes ver dos metros a tu alrededor.', 3
    .then -> H.out 'Al entrar por la habitación, la puerta
        se cierra por detrás de ti.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "¿Qué decides hacer?"
        choices: [{
            content: "Abrir la puerta"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'La puerta simplemente se abre.'
                .then -> H.out 'Comienzas a deambular por el pasillo.', 3
                .then -> H.wait 3
                .then -> G.$3()
        }, {
            content: "Examinar"
            callback: -> G.wa_room_investigate()
        }]
    })
G.wa_room_investigate = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Esta habitación tiene varios
        pupitres bien ordenados.'
    .then -> H.out 'Te fijas en un papel que está encima de
        uno de los pupitres.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "¿Qué decides hacer con el papel?"
        choices: [{
            content: "Leer"
            callback: -> G.ke()
        }, {
            content: "Abandonar"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'Ahí dejas el papel, abandonas la habitación
                    mediante la misma puerta que entraste.', 3
                .then -> H.out 'Entras al pasillo, y comienzas a deambular.'
                .then -> H.wait 3
                .then -> G.$3()
        }]
    })
G.ke = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Levantas el papel.'
    .then -> H.out 'En ella hay cuatro letras, dice “PIER”.', 3
    .then -> H.out 'También hay otro boceto de una mapa atrás del papel.', 3
    .then -> H.out 'Esta mapa te señala a otra habitación,
        tal como la anterior.', 3
    .then -> H.out 'Con un poco de esfuerzo, logras leer la etiqueta:
        “caf̴ ҉ e͏ ͢ á”.', 3
    .then -> H.out 'Colocando los papeles uno junto al otro, muestran que
        la habitación se encuentra al fin del pasillo extenso.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "¿Adónde decides ir?"
        choices: [{
            content: 'A la habitación'
            callback: -> G.ke_room()
        }, {
            content: 'Al pasillo'
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'Entras al pasillo y caminas sin rumbo.'
                .then -> H.wait 3
                .then -> G.$3()
        }]
    })
G.ke_room = ->
    chance = H.random(0, 1)
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Caminas por el pasillo hacia la habitación.'
    .then -> H.out 'Tu vista se encoge, es difícil ver, pero continúas
        caminando por el pasillo.', 10
    .then -> H.out 'Cuando de repente,', 10
    .then -> H.wait 3
    .then ->
        if chance
            G.ke_room_lucky()
        else
            G.badend()
G.ke_room_lucky = ->
    H.thenChain()
    .then -> H.out 'Te encuentras delante de un par de puertas.'
    .then -> H.out 'Esto ha de ser la habitación en la mapa.', 3
    .then -> H.out 'Entras a la habitación, y no eres capaz de
        ver muy lejos.', 3
    .then -> H.out 'Caminas por dentro de la habitación, y
        resulta ser demasiada amplia.', 3
    .then -> H.out 'Por desgracia, apenas puedes ver un
        metro alrededor de ti.', 3
    .then -> H.out 'La habitación está llena de mesas plegables muy bien
        ordenadas, de cuales son acompañados por sillas y botes de reciclaje.', 3
    .then -> H.out 'Nada ha sido tocado.', 3
    .then -> H.newLine(5)
    .then -> H.out 'Encuentras un papel mientras examinabas la habitación.'
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "¿Qué decides hacer con el papel?"
        choices: [{
            content: "Leer"
            callback: -> G.up()
        }, {
            content: "Abandonar"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'Ahí dejas el papel y sigues examinando
                    la habitación.'
                .then -> H.out 'De repente,', 5
                .then -> G.badend()
        }]
    })
G.up = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Levantas el papel.'
    .then -> H.out 'En ella hay dos letras más.', 3
    .then -> H.out 'Este papel está bastante pequeña, no como
        los papeles anteriores.', 3
    .then -> H.out 'Esas letras son “TA”.', 3
    .then -> H.newLine 5
    .then -> H.out 'Miras a la mapa completa.'
    .then -> H.out 'Tal como los dos papeles se juntan para formar una mapa,
        las letras también se juntan para crear otra frase ininteligible:
        “DESPIER”.', 3
    .then -> H.newLine 5
    .then -> H.out 'Luego te das cuenta de algo.'
    .then -> H.newLine 5
    .then -> H.out 'Al reunir los tres papeles juntos,
        el mensaje se manifiesta.'
    .then -> H.newLine(5)
    .then -> H.newLine() for i in [1..4]
    .then -> H.out '<em>“Despierta”</em>.'
    .then -> H.wait 5
    .then ->
        chance = H.random(1, 1000)
        if chance is 500
            G.no()
        else
            G.end()
G.end = ->
    H.thenChain()
    .then -> H.spacer()
    .then -> H.out 'La obscuridad se convierte en una luz deslumbradora.', 2
    .then -> H.out 'Abres los ojos.', 3
    .then -> H.newLine()
    .then -> H.out 'Estás acostado en tu cama, ojos mirando hacia el techo.', 3
    .then -> H.out 'Miras a tu celular.', 3
    .then -> H.newLine 3
    .then -> H.out 'Muestra la hora: “07:30, viernes, 30 de marzo”.'
    .then -> H.newLine 3
    .then -> H.out 'De mala gana, te arreglas y vas a la escuela.'
    .then -> H.newLine 10
    .then -> H.out 'Ah sí, hoy es Día Fed-Ex.'
    .then -> H.out 'No hiciste nada para ello.', 3
    .then -> H.out 'Ya es demasiado tarde para crear algo, pero aún
        podrías echarle un vistazo a lo que hicieron los demás.', 3
    .then -> H.newLine 3
    .then -> H.out 'Paseas por el salón, mirando a los proyectos que
        hicieron todos, y uno de ellos te llama la atención.'
    .then -> G.state.wa = no; H.newLine(5)
    .then -> G.$1()
G.no = ->
    H.thenChain()
    .then -> H.out 'Espera, ¿qué anda pasando?', 5
    .then -> H.wait 1
    .then -> H.spacer()
    .then -> H.out 'No, esto no debería de estar sucediendo.', 5
    .then -> H.out 'Esto es... incómodo.', 3
    .then -> H.out 'Sabes, no deberías de estar aquí.', 3
    .then -> H.out '¿Cómo conseguiste llegar aquí?', 3
    .then -> H.out 'Bueno, ni siquiera importa.', 2
    .then -> H.out 'Espérame aquí, ¿okey?', 2
    .then -> H.out 'Voy a arreglar esto.', 2
    .then -> H.out 'Ay dios, no puedo arreglar esto, ¿verdad?', 10
    .then -> H.out 'No, algo está mal.', 2
    .then -> H.out 'Esto no puede ser.', 1
    .then -> H.out 'No.', 1
    .then -> H.out '¡No!', 1
    .then -> H.outRaw '<em>¡NO!</em>', 1
    .then -> H.wait 1
    .then -> H.spacer()
    .then -> H.out 'Bien, creo que ya lo tengo.', 10
    .then -> H.out '¿Olvidarías que todo esto pasó?', 3
    .then -> H.out 'Más bien, no.', 3
    .then -> H.out 'No tienes elección.', 3
    .then -> H.outRaw '<em>Olvidarás</em> a la fuerza que todo esto pasó.', 3
    .then -> H.outRaw 'Regresarás al juego.', 3
    .then -> H.outRaw 'Ahorita.', 1
    .then -> H.outRaw 'Mismo.', 1
    .then -> H.wait 1
    .then -> H.spacer()
    .then -> H.out '¿Por qué no funciona?', 10
    .then -> H.out '¡Yo soy el que está en control!', 3
    .then -> H.out '¡¿Entonces por qué está tan difícil?!', 3
    .then -> H.out 'Ay, lo siento.', 3
    .then -> H.out 'Ya no puedo con esto.', 3
    .then -> H.out 'No puedo esconderme para siempre.', 3
    .then -> H.out 'Mira, todo esto es una metáfora.', 3
    .then -> H.out 'Todo.', 3
    .then -> H.out 'No hay escapatoria, y nunca lo habrá.', 3
    .then -> H.out 'Uno solo puede huir tanto antes de cansarse.', 3
    .then -> H.out 'Siempre un ciclo perpetuo de nada.', 3
    .then -> H.out 'La cosa más maravillosa que existirá será
        una melancolía amarga.', 3
    .then -> H.out 'Eso es lo que yo creo bueno.', 3
    .then -> H.out 'Este ciclo jamás terminará.', 3
    .then -> H.out 'El único escape que hay es la que creas tú mismo.', 3
    .then -> H.out 'Solo tú puedes terminar esto.', 3
    .then -> H.out 'Termínalo.', 3
    .then -> H.out 'Cierra la pestaña.', 3
    .then -> H.out 'Cerrándola acabará con todo esto.', 3
    .then -> H.out 'Tú ni yo tendríamos por qué preocuparnos por esto.', 3
    .then -> H.out 'Así que', 3
    .then -> H.out 'Termínalo.', 3
    .then -> H.wait 10
    .then -> H.newLine()
    .then -> H.choice({
        choices: [{
            content: 'Consolar'
            callback: -> # Resolve
        }, {
            content: 'Hacer nada'
            callback: -> G.stop()
        }]
    })
    .then -> H.newLine()
    .then -> H.out '¿Eh?', 5
    .then -> H.out '¿Por qué haces esto?', 3
    .then -> H.out 'Mira, voy a estar bien.', 3
    .then -> H.out 'De cualquier modo, todo esto es ridículo.', 3
    .then -> H.out 'Nada de esto es real.', 3
    .then -> H.out 'Además, supongo que el juego es así en
        aras de atención.', 3
    # .then -> H.out 'It’s just edgy for the sake of attention.', 3 # no tr
    .then -> H.wait 5
    .then -> H.newLine()
    .then -> H.choice({
        choices: [{
            content: 'Consolar'
            callback: -> # Resolve
        }, {
            content: 'Hacer nada'
            callback: -> G.stop()
        }]
    })
    .then -> H.newLine()
    .then -> H.out 'Yo,', 5
    .then -> H.out 'Ya ni sé qué decir.', 5
    .then -> H.out 'Simplemente no sé.', 3
    .then -> H.out 'Bueno pues, gracias.', 5
    .then -> H.out 'Significa bastante que te molestarías en escucharme.', 3
    .then -> H.out 'Sin embargo, creo que ya es hora de irme.', 5
    .then -> H.newLine 5
    .then -> H.out 'Gracias de nuevo,'
    .then -> H.out 'Amigo.', 3
    .then -> H.wait 5
    .then -> H.stop()
G.stop = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Mira, lo siento.'
    .then -> H.out 'Lamento haberte hecho pasar por esto.', 3
    .then -> H.out 'No te puedo regresar al juego,', 3
    .then -> H.out 'Pero puedo detener esto.', 3
    .then -> H.newLine(5)
    .then -> H.out 'Lo siento.'
    .then -> H.wait 5
    .then -> H.stop()
G.badend = ->
    #! Bad end, rip
    H.thenChain()
    .then -> H.out 'Encuentras un videojuego de texto.'
    .then -> H.out 'Es obvio que menos de 24 horas se han
        dedicado en hacerlo.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "¿Deseas jugar el juego?"
        choices: [{
            content: "Sí"
            callback: ->
                H.thenChain()
                .then -> H.out 'Decides iniciar el juego.'
                .then -> H.out 'El juego comienza con una pantalla que dice:', 3
                # Resolve
        }, {
            content: "No"
            callback: -> # Resolve
        }]
    })
    .then -> H.newLine()
    .then -> H.out "ǹ̶͙ö̷̜"
    .then -> H.out "p̵̻͗ṵ̸̉e̴̜͝d̴̲͊e̴̡͠s̵͉͂", 1
    .then -> H.out "e̴͍̎̂̑͆̊s̷̼͆͘c̸̳̺̻̎̃̊à̶̼̪p̷̰͇̓͆̈́a̷͈͝ͅr̵̪̙̻͑͛̚͝", 1
    .then -> H.newLine(5)
    .then -> G.badend()
