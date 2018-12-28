---
title: Haruka Teardown
date:     2018-07-30 23:36:57 CDT
last_mod: 2018-08-07 16:06:59 CDT
layout: post
comments: true
description: >
    A somewhat comprehensive teardown on how Haruka works.
excerpt: >
    How Haruka works.
image:
    src: "/assets/Haruka-minun.png"
    alt: "A screenshot of a Discord chat."
    color: "#36393f"
---

<div class="block-warn">
    <p>
        <strong>This post is out of date. :/</strong><br>
        The contents of this post do not reflect changes
        made after version 2.0.0 of Haruka. Nevertheless,
        this guide is accurate up to Haruka v1.4.0 and
        previous versions.
    </p>
</div>

This is a somewhat~ comprehensive guide on how Haruka works.
- [GitHub Repository][github-discord-haruka]
- [Add Haruka][add-haruka] to your Discord server.

There’s four main parts to Haruka:
1. Setup: `main.coffee`
    - Connects to Discord and listens for messages.
2. Haruka Core: `Haruka.coffee`
    - Collects all Functions and determines which
      one should be run.
3. Functions
    - Haruka’s high-level methods.
4. The Haruka object
    - Settings, configuration, and functions are attached here,
      and can be accessed at any time.

---

## Setup
The Setup script (`main.coffee`) is Haruka’s entry point. To run Haruka, execute this script via `node dist/main.js` or `coffee src/main.coffee`. This script is responsible for connecting Haruka to Discord. Although it’s called `main.coffee`, not much happens in this script. The most important parts are as follows:

```coffee
Haruka = require './Haruka.js'
config = require '../config.json'
client = new Discord.Client
client.on 'message', (msg) ->
    Haruka.try msg

client.login config.token
```

The script adds a couple of event listeners, and when a message is received, it is passed to the `Haruka.try` function.

-----

## Haruka
The core of Haruka is in the `Haruka.coffee` script. This script
is responsible for:

1. Collecting all the functions and specials that can be executed.
2. Executing functions and specials and sending an appropriate response.

### Collecting functions and specials
The first part of the `Haruka.coffee` script looks in the `/functions` and `/specials` folders for functions and specials. Then, these functions are added to arrays for later.

```coffee
Haruka = {}
Haruka.functions = []
Haruka.specials  = []

#! ========================================
#! Take Haruka's functions and add them to the queue
fs.readdirSync "#{__dirname}/functions"
    .filter (filename) ->
        /^(?:[^_]).+(?:\.(?:coffee|js))/.test filename
    .forEach (filename) ->
        Haruka.functions.push(
            require "#{__dirname}/functions/#{filename}"
        )

#! ========================================
#! Likewise, take Haruka's special functions and add them to the other queue
fs.readdirSync "#{__dirname}/specials"
    .filter (filename) ->
        /^(?:[^_]).+(?:\.(?:coffee|js))/.test filename
    .forEach (filename) ->
        Haruka.specials.push(
            require "#{__dirname}/specials/#{filename}"
        )
```

A function is only added if it's a script (obviously) and if it doesn’t start with an underscore. If you wish to exclude a function from Haruka, rename that script so that it begins with an underscore.

### Executing functions and specials
The heart of Haruka lies in the `Haruka.try` method. Here’s the function, in plain English.

- Run all specials.
    - If the special handles the message, it should return a truthy value.
    - If the special doesn’t handle the message, it should return a false-y value.
- `Haruka.try` will end early if a Special returns a truthy value.
- `Haruka.try` will end early if the message doesn’t start with the prefix (`-h`) or if the message was sent by a bot.
- Execute all of the Function’s RegExp’s against the message content, excluding the prefix.
    - If there’s a match, run that function.
- If there are no RegExp matches, Haruka replies saying that she didn’t recognize that command.


```coffee
Haruka.try = (msg) ->
    #! Run Specials first
    for fn in Haruka.specials
        #! Break if handler returns a truthy value.
        if fn.handler(msg, Haruka) then return

    #! Tokenize input
    txt = msg.content.tokenize()
    txt[1] = if txt[1] then txt[1] else "help"

    #! Check if the message starts with the prefix,
    #! and it's not from another bot.
    if (txt[0] isnt Haruka.prefix) or msg.author.bot then return

    #! Run through all the commands and see if one matches.
    for fn in Haruka.functions
        regexMatch = fn.regex.exec txt[1]
        if regexMatch
            return fn.handler(msg, regexMatch, Haruka)

    #! Catchall
    return msg.reply [
        "Hmm, I'm not sure what you mean by that."
        "Sorry, I don't know what you meant by that."
        "I’m not sure I understand."
        "I’m not sure what you mean."
    ].choose() + " Try `-h help` for a list of commands."
```

-----

## Functions and Specials

Functions and specials take on very similar formats. Both are exported via `module.exports`, and both share a couple of the same attributes, but there are important distinctions to be made. Here's the simplest example of an exported function object:

```coffee
# Function object
module.exports = {
    name: "Function name"
    regex: /^(fn|function)(\s+|$)/i
    handler: (msg, regexMatch, Haruka) -> msg.reply "Hello world!"
    help:
        short: "-h fn          :: Short function description."
        long: """
            \`\`\`asciidoc
            === Help for Function ===
            *Aliases*: list, of, aliases
            -h fn       :: Function without arguments.
            -h fn <arg> :: Function with arguments.
            \`\`\`
        """
}
```
- `name`
    - [*String:*][mdn-string] The name of the function. Pretty self explanatory.
- `regex`
    - [*RegExp:*][mdn-regexp] The function’s Regular Expression. This RegExp is tested against message input **without the Haruka prefix.** If there’s a match, `handler` is called.
- `handler`
    - [*Function:*][mdn-function] The function’s ... message handler. Here’s where all of the magic happens. It’s passed 3 arguments:
        - `msg`
            - [*Message:*][d-msg] The Discord Message that triggered the function.
        - `regexMatch`
            - [*Array (RegExp result):*][mdn-regexp-exec] The Regular Expression match. The result of calling the `exec` function on the RegExp.
        - `Haruka`
            - [*Object:*][mdn-object] The Haruka object.
- `help`
    - [*Object:*][mdn-object] The function’s help descriptions.
        - `short`
            - [*String:*][mdn-string] The function’s short help description. This appears in the `-h help` command list.
        - `long`
            - [*String:*][mdn-string] The function’s long help description. This appears when calling `-h help <name>` It should be very descriptive, documenting the function’s usage and arguments.
        - `hidden`
            - [*Boolean:*][mdn-boolean] When set to true, this function won’t appear in the `-h help` command list.

A Special has a much shorter format. Note that because there’s no RegExp, `handler` is called on every message. The handler’s return value determines whether the `Haruka.try` function ends early. The handler should return a truthy value if it handled the message, otherwise it should return something false-y.


```coffee
# Special object
module.exports = {
    name: "Special name"
    handler: (msg, Haruka) -> msg.reply "Hello world!"
}
```
- `name`
    - [*String:*][mdn-string] The name of the special. Pretty self explanatory.
- `handler`
    - [*Function:*][mdn-function] The special’s message handler. Here’s where all of the magic happens. It’s passed 2 arguments:
        - `msg`
            - [*Message:*][d-msg] The Discord Message.
        - `Haruka`
            - [*Object:*][mdn-object] The Haruka object.


-----

## The Haruka object

Every script has access to the Haruka object. Environment variables, scripts, and the Discord client are all attached to this object. The object looks like this:

```coffee
Haruka = {
    client: new Discord.Client
    config: require '../config.json'
    dev: this.config.dev
    functions: []
    prefix: if this.dev then '#h' else '-h'
    specials: []
    try: (msg) -> # ...
    version: this.config.version
}
```

- `client`
    - [*Client:*][d-client] The main hub for interacting with the Discord API, and the starting point for any bot.
- `config`
    - [*Object:*][mdn-object] The contents of `config.json`.
- `dev`
    - [*Boolean:*][mdn-boolean] Whether Haruka is in dev mode or not. This is the same as `Haruka.config.dev`
- `functions`
    - [*Array:*][mdn-array] An array of Function objects. See [Functions and Specials](#functions-and-specials).
- `prefix`
    - [*String:*][mdn-string] The Haruka prefix. [This is determined by the value of `Haruka.dev`.](https://github.com/MindfulMinun/discord-haruka/blob/master/src/main.coffee#L12){:target="_blank" _="_"}
- `specials`
    - [*Array:*][mdn-array] An array of Special objects. See [Functions and Specials](#functions-and-specials).
- `try`
    - [*Function:*][mdn-function] This function determines what function or special should be executed. See [Executing functions and specials](#executing-functions-and-specials).
- `version`
    - [*String:*][mdn-string] Haruka’s current version. This is the same as `Haruka.config.version`

<!-- Reference links -->
[add-haruka]: https://discordapp.com/oauth2/authorize?client_id=458130019554820127&scope=bot&permissions=125966
[github-discord-haruka]: https://github.com/MindfulMinun/discord-haruka "MindfulMinun/discord-haruka: Haruka, a useless Discord bot."
[d-msg]: https://discord.js.org/#/docs/main/stable/class/Message "Message • discord.js"
{:target="_blank"}
[d-client]: https://discord.js.org/#/docs/main/stable/class/Client "Client • discord.js"
{:target="_blank"}
[mdn-regexp]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp "RegExp - JavaScript | MDN"
{:target="_blank"}
[mdn-regexp-exec]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec "RegExp.prototype.exec() - JavaScript | MDN"
{:target="_blank"}
[mdn-array]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array "Array - JavaScript | MDN"
{:target="_blank"}
[mdn-object]: https://developer.mozilla.com/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object "Object - JavaScript | MDN"
{:target="_blank"}
[mdn-string]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String "String - JavaScript | MDN"
{:target="_blank"}
[mdn-boolean]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean "Boolean - JavaScript | MDN"
{:target="_blank"}
[mdn-function]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function "Function - JavaScript | MDN"
{:target="_blank"}
