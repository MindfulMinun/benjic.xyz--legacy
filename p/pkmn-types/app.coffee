---
---

# https://gist.github.com/MindfulMinun/9c85273a20220744a973b95ab5b09dbe

Poke = null # Expose Poke to this scope up here
do ->
    @Poke = Poke = {}

    Poke._typeEffectivenessMatrix = [
        "1 1 1 1 1 ½ 1 0 ½ 1 1 1 1 1 1 1 1 1" # Normal
        "2 1 ½ ½ 1 2 ½ 0 2 1 1 1 1 ½ 2 1 2 ½" # Fighting
        "1 2 1 1 1 ½ 2 1 ½ 1 1 2 ½ 1 1 1 1 1" # Flying
        "1 1 1 ½ ½ ½ 1 ½ 0 1 1 2 1 1 1 1 1 2" # Poison
        "1 1 0 2 1 2 ½ 1 2 2 1 ½ 2 1 1 1 1 1" # Ground
        "1 ½ 2 1 ½ 1 2 1 ½ 2 1 1 1 1 2 1 1 1" # Rock
        "1 ½ ½ ½ 1 1 1 ½ ½ ½ 1 2 1 2 1 1 2 ½" # Bug
        "0 1 1 1 1 1 1 2 1 1 1 1 1 2 1 1 ½ 1" # Ghost
        "1 1 1 1 1 2 1 1 ½ ½ ½ 1 ½ 1 2 1 1 2" # Steel
        "1 1 1 1 1 ½ 2 1 2 ½ ½ 2 1 1 2 ½ 1 1" # Fire
        "1 1 1 1 2 2 1 1 1 2 ½ ½ 1 1 1 ½ 1 1" # Water
        "1 1 ½ ½ 2 2 ½ 1 ½ ½ 2 ½ 1 1 1 ½ 1 1" # Grass
        "1 1 2 1 0 1 1 1 1 1 2 ½ ½ 1 1 ½ 1 1" # Electric
        "1 2 1 2 1 1 1 1 ½ 1 1 1 1 ½ 1 1 0 1" # Psychic
        "1 1 2 1 2 1 1 1 ½ ½ ½ 2 1 1 ½ 2 1 1" # Ice
        "1 1 1 1 1 1 1 1 ½ 1 1 1 1 1 1 2 1 0" # Dragon
        "1 ½ 1 1 1 1 1 2 1 1 1 1 1 2 1 1 ½ ½" # Dark
        "1 2 1 ½ 1 1 1 1 ½ ½ 1 1 1 1 1 2 2 1" # Fairy
    ].map((row) ->
        row.split(" ").map((x) ->
            switch x
                when "0" then 0
                when "1" then 1
                when "½" then .5
                when "2" then 2
                else throw Error 'Internal error: Elements of
                    `typeEffectivenessMatrix` should consist of enums, either
                    "0", "1", "½", "2"'
        )
    )

    Poke.typings = "Normal Fighting Flying Poison
                    Ground Rock Bug Ghost Steel Fire
                    Water Grass Electric Psychic Ice
                    Dragon Dark Fairy".split ' '

    Poke.determineTypingMultiplier = (offense, defense1, defense2) ->
        # Two multipliers, initially set to 1
        m1 = 1; m2 = 1

        if offense not in Poke.typings
            throw Error "Expected `offense` to be a string
                representing a Pokémon typing."

        if defense1 not in Poke.typings
            throw Error "Expected `defense1` to be a string
                representing a Pokémon typing."

        offenseKey = Poke.typings.indexOf(offense)
        defense1Key = Poke.typings.indexOf(defense1)

        m1 = Poke._typeEffectivenessMatrix[offenseKey][defense1Key]

        if typeof defense2 is "string"
            if defense2 not in Poke.typings
                throw Error "Expected `defense2` to be a string
                    representing a Pokémon typing."
            defense2Key = Poke.typings.indexOf(defense2)
            m2 = Poke._typeEffectivenessMatrix[offenseKey][defense2Key]

        [m1, m2].reduce((acc, val, i, arr) -> acc * val)

#* ======================================== *#

# Add event listeners in batch.
# coffeelint: disable=space_operators
{% include xyz/addEventListeners.coffee %}
# coffeelint: enable=space_operators

# Mark DOM nodes with dollar signs? Idk
$Atk  = document.getElementById 'atk'
$Def1 = document.getElementById 'def-1'
$Def2 = document.getElementById 'def-2'
selects = [$Atk, $Def1, $Def2]
defs = [$Def1, $Def2]

selects.forEach((s) -> s.removeAttribute 'disabled')

# When Def is updated, disable the other's option.
# i.e., if Def1 is Normal, Def2 cannot be normal. Disable Def2's Normal.
xyz.addEventListeners defs, 'change', ->
    [notMe] = defs.filter((d) => d isnt @)
    notMe.querySelector('option:disabled')?.disabled = false
    notMe.querySelector("option[value='#{@value}']")?.disabled = true

xyz.addEventListeners selects, 'change', ->
    [atk, def1, def2] = selects.map((s) -> s.value)
    location.replace '#' + encodeURIComponent [atk, def1, def2].join '~'

    def2 = undefined if def2 is 'null'
    i18n.format Poke.determineTypingMultiplier(atk, def1, def2)

xyz.ready ->
    if location.hash
        [atk, def1, def2] = location.hash.substring(1).split('~')

        getValidOptions = (select) ->
            Array.from select.options
                .filter((o) -> not o.disabled)
                .map((o) -> o.value)

        $Atk.value  = atk  if atk  in getValidOptions $Atk
        $Def1.value = def1 if def1 in getValidOptions $Def1
        $Def2.value = def2 if def2 in getValidOptions $Def2

        selects.forEach((s) -> s.dispatchEvent(new Event 'change'))

selects.forEach((s) -> s.dispatchEvent(new Event 'change'))
