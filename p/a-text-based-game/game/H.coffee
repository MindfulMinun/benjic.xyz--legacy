---
---
#! ========================================
#! Helpers
H = window.H = {}
Terminal = document.getElementById 'terminal'

H.parseHTML = (html) ->
    tmp = document.implementation.createHTMLDocument()
    tmp.body.innerHTML = html
    Array.from tmp.body.children
H.out = (text, timeout) ->
    new Promise (resolve, reject) ->
        line = H.parseHTML("<span class='terminal--line'>#{text}</span>")[0]
        H.wait(timeout).then ->
            Terminal.appendChild(line)
            H.scroll(line)
            resolve(line)
H.outRaw = -> H.out(arguments...) # Allow for raw HTML
H.newLine = (timeout) -> H.out('', timeout) # Newline helper
H.thenChain = (fn) ->
    return new Promise (resolve, reject) -> fn?(); resolve()
H.choice = (options) ->
    new Promise (resolve, reject) ->
        btns = []
        _createButton = (data) ->
            btn = H.parseHTML("
                <button class=\"terminal--btn\">#{data.content}</button>
            ")[0]
            btn.addEventListener 'click', ->
                (b.setAttribute('disabled', yes) for b in btns)
                this.classList.add('terminal--btn__chosen')
                resolve(data.callback())
            btns.push(btn)

        (_createButton(b) for b in options.choices)
        choiceWrapper = H.parseHTML("
            <div class=\"terminal--choice terminal--line\">
                #{options.content ? ''}
            </div>
        ")[0]
        (choiceWrapper.appendChild(b) for b in btns)
        Terminal.appendChild choiceWrapper
H.wait = (timeout) ->
    new Promise (resolve, reject) ->
        setTimeout ->
            resolve()
        , Number(timeout ? 0) * 1000
H.random = (min, max) ->
    if not max?
        [min, max] = [0, min]
    Math.floor(
        Math.random() * (max - min + 1)
    ) + min
H.spacer = (timeout) ->
    new Promise (resolve, reject) ->
        line = H.parseHTML("<span class='terminal--line
            terminal--vertical-spacer'></span>")[0]
        H.wait(timeout).then ->
            Terminal.appendChild(line)
            H.scroll(line)
            resolve(line)
H.scroll = (el) ->
    h = document.documentElement
    requestAnimationFrame ->
        requestAnimationFrame ->
            h.scrollTop += 16 * 3
H.stop = ->
    #! Prevent the game from accidentally being progressed further.
    H.out = -> new Promise ->
    Terminal.innerHTML = ''
