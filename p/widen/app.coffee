---
---
#! Get some DOM elements
txt = document.getElementById "txt"
res = document.getElementById "results"
copy = document.getElementById "copy"

txt.addEventListener 'input', ->
    res.innerHTML = toFullwidth @value
copy.addEventListener 'click', ->
    xyz.copy toFullwidth txt.value
    .then ->
        xyz.toast {
            content: "Copied to clipboard successfully."
            timeout: 3500
        }
    .catch ->
        xyz.toast {
            content: "Failed to copy text."
            timeout: 3500
        }

#! ========================================
#! Latin to fullwidth maps
latin = [
    '!"#$%&\'()*+,-./'
    '0123456789:;<=>?'
    '@ABCDEFGHIJKLMNO'
    'PQRSTUVWXYZ[\\]^_'
    '`abcdefghijklmno'
    'pqrstuvwxyz{|}~'
    '¢£¥• '
].join ''
fullwidth = [
    '！＂＃＄％＆＇（）＊＋，－．／'
    '０１２３４５６７８９：；＜＝＞？'
    '＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯ'
    'ＰＱＲＳＴＵＶＷＸＹＺ［＼］＾＿'
    '｀ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏ'
    'ｐｑｒｓｔｕｖｗｘｙｚ｛｜｝～'
    '￠￡￥・　'
].join ''

#! ========================================
#! Converter
toFullwidth = (txt) ->
    #! Match any character...
    String(txt).replace(/[\s\S]+?/g, (match, pos, string) ->
        i = latin.indexOf match
        if i isnt -1
            #! If it's in the latin set, replace it with it's
            #! fullwidth equivalent
            fullwidth[i]
        else
            #! If not, just return that character ¯\_(ツ)_/¯
            match
    )

console.log(
    #! Just as an easter egg to whomever opens the console.
    "%c" + (toFullwidth "Enjoying\n  the\n    aesthetic?"),
    "font-size: 18px; font-family: Helvetica, sans-serif"
)


# coffeelint: disable=space_operators

#! Autoresize textareas
{% include xyz/textarea.coffee %}
#! Copy some text
{% include xyz/copy.coffee %}
