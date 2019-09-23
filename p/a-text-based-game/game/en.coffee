---
---
# A text-based game

#! ========================================
#! Game State + Chapters
G = window.en = {}
G.state =
    #! "Wa ke up"
    wa: no
    hasEnded: no
#! Chapters
G.$1 = ->
    #! Game 1
    H.thenChain()
    .then -> H.out 'You stumble upon a text-based game.'
    .then -> H.out 'It’s clear that no more than 24
        hours of work has been put into it.', 3
    .then -> H.newLine 3
    .then -> H.choice({
        content: 'Do you play the game?'
        choices: [{
            content: 'Yes'
            callback: ->
                H.out "You start the game."
        }, {
            content: 'No'
            callback: ->
                H.out "The temptation is too much for you, and you
                    end up starting the game anyway."
        }]
    })
    .then -> H.out "The game starts off with you looking
            at a screen that reads:", 3
    .then -> H.out '“You stumble upon a text-based game.”', 3
    .then -> H.out "You could have sworn you have seen
        this somewhere before.", 3
    .then -> H.out '“It’s clear that no more than 24
        hours of work has been put into it.”', 3
    .then -> H.newLine 3
    .then -> H.choice {
        content: "What do you do?"
        choices: [{
            content: "Play"
            callback: -> G.$1()
        }, {
            content: "Investigate"
            callback: -> G.$2()
        }]
    }
G.$2 = ->
    #! Game 2
    H.thenChain()
    .then -> H.out 'You look around at your surroundings.'
    .then -> H.out "There's just enough light to see nearly
        10 feet around you.", 3
    .then -> H.out "This place seems very familiar to you.", 3
    .then -> H.newLine 3
    .then -> H.choice {
        content: 'What do you do?'
        choices: [{
            content: "Investigate"
            callback: -> G.$2_investigate()
        },{
            content: "Wander"
            callback: ->
                H.out '...'
                G.$3()
        }]
    }
G.$2_investigate = ->
    H.thenChain()
    .then -> H.out 'Looking around the room, you notice that
        it is also quite spacious.'
    .then -> H.out 'One of the walls is made of many glass panes.', 3
    .then -> H.out 'Outside of the glass wall is an empty void.', 3
    .then -> H.out 'Several tables and chairs crowd
        the center of the room.', 3
    .then -> H.out 'They are aligned neatly and are clearly untouched.', 3
    .then -> H.newLine 6
    .then -> H.out 'You have also noticed a piece of
        paper on the floor near you.'
    .then -> H.newLine 3
    .then -> H.choice {
        content: "What do you do with the piece of paper?"
        choices: [{
            content: "Take"
            callback: -> G.wa()
        }, {
            content: "Leave"
            callback: ->
                H.out 'You leave the piece of paper behind and
                    wander aimlessly.'
                G.$3()
        }]
    }
G.$3 = ->
    #! Chapter 3
    # console.log "G.$3"
    H.thenChain()
    .then -> H.out 'After a bit of wandering, you
        start to notice something.', 10
    .then -> H.out 'The darkness seems to have come closer.', 3
    .then -> H.out 'It’s significantly harder to see.', 3
    .then -> H.out 'But you keep walking.', 10
    .then -> H.newLine()
    .then -> H.out 'You’re lost.', 3
    .then -> H.out 'While wandering, you have noticed
        that this place is some sort of school.', 3
    .then -> H.out 'Along the looping hallways are classrooms
        that are full of tables and chairs.', 3
    # .then -> H.out '', n
    .then -> H.choice {
        content: 'Do you enter one of the classrooms?'
        choices: [{
            content: 'Yes'
            callback: -> G.$3_classroom()
        }, {
            content: 'No'
            callback: ->
                H.thenChain()
                .then -> H.out 'You keep walking.'
        }]
    }
    .then -> H.newLine(10)
    .then -> H.out 'You’re growing tired of walking.'
    .then -> H.out 'You can’t see more than 2 feet in front of you.', 3
    .then -> H.out 'But you keep walking.', 3
    .then -> H.newLine(10)
    .then -> H.out 'You can’t see anymore.'
    .then -> H.out 'You’re tired, but can’t sleep.', 3
    .then -> H.out 'You can’t feel your legs.', 3
    .then -> H.out 'But you keep walking.', 3
    .then -> H.newLine(10)
    .then -> H.out 'Suddenly,'
    .then -> H.wait(3)
    .then -> G.badend()
G.$3_classroom = ->
    chance = H.random(0, 1)
    if chance
        if G.state.wa is true
            H.thenChain()
            .then -> H.newLine()
            .then -> H.out 'Upon entering the classroom,'
            .then -> H.wait 3
            .then -> G.badend()
        else
            H.thenChain()
            .then -> H.newLine()
            .then -> H.out 'Upon entering the classroom,'
            .then -> H.out 'You fall unconscious.', 3
            .then -> H.newLine(10)
            .then -> H.out 'You wake up on a floor.'
            .then -> H.out 'Next to you is a piece of paper.', 3
            .then -> H.newLine(3)
            .then -> H.choice({
                content: "Do you pick up the piece of paper?"
                choices: [{
                    content: "Yes"
                    callback: -> G.wa()
                }, {
                    content: "No"
                    callback: -> # Resolve.
                }]
            })
            .then -> H.newLine()
            .then -> H.out 'You stand up and try leaving the classroom.'
            .then -> H.out 'The door will not budge.', 3
            .then -> H.out 'You’re clearly stuck here.', 5
            .then -> H.out 'You look back at where you woke up.', 3
            .then -> H.out 'The piece of paper is gone.', 5
            .then -> H.out 'Your vision grows darker.', 3
            .then -> H.out 'You walk about, trying to
                find something to escape.', 3
            .then -> H.newLine(10)
            .then -> H.out 'Suddenly,'
            .then -> H.wait 3
            .then -> G.badend()
    else
        H.thenChain()
        .then -> H.newLine()
        .then -> H.out 'Upon entering the classroom,'
        .then -> H.wait 3
        .then -> G.badend()
G.wa = ->
    #! Game WA
    G.state.wa = true
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'You pick up the piece of paper.'
    .then -> H.out 'On it are two letters and a hastily drawn map.', 3
    .then -> H.out 'The letters read, “WA”.', 3
    .then -> H.out 'The map closely resembles the room you
        are in, and appears to have a label.', 3
    .then -> H.out 'The label is smudged, and the
        darkness is of no help either.', 3
    .then -> H.out 'All you can make of it is “cy҉ ͏ ̷r̢ ̛ f̡ ̢”.', 3
    .then -> H.out 'The map also shows that there is a room
        nearby, connected with a lengthy hallway.', 3
    .then -> H.out 'The nearby room also has a label,
        but all you can make out is, “ųl҉ ̕p̨e҉ ”.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "Where do you go?"
        choices: [{
            content: "Room"
            callback: ->
                G.wa_room()
        }, {
            content: "Hallway"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'You enter the hallway
                    and wander aimlessly.'
                .then -> H.wait 3
                .then -> G.$3()
        }]
    })
G.wa_room = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'As you enter the hallway, the
        darkness draws noticeably closer.'
    .then -> H.out 'You’re only able to see 7 feet around you.', 3
    .then -> H.out 'Upon entering the room, a door is shut behind you.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "What do you do?"
        choices: [{
            content: "Open door"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'The door simply opens.'
                .then -> H.out 'You venture down the hallway.', 3
                .then -> H.wait 3
                .then -> G.$3()
        }, {
            content: "Investigate"
            callback: -> G.wa_room_investigate()
        }]
    })
G.wa_room_investigate = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'The room you’re in has several neatly arranged desks.'
    .then -> H.out 'You notice a piece of paper on one of the desks.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "What do you do with the piece of paper?"
        choices: [{
            content: "Take"
            callback: -> G.ke()
        }, {
            content: "Leave"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'You left the piece of paper and
                    leave through the door you came in.', 3
                .then -> H.out 'You enter the hallway and start
                    wandering aimlessly.'
                .then -> H.wait 3
                .then -> G.$3()
        }]
    })
G.ke = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'You pick up the piece of paper.'
    .then -> H.out 'There are two letters on it that read, “KE”.', 3
    .then -> H.out 'There’s also another map hastily drawn on the
        piece of paper.', 3
    .then -> H.out 'This map shows another room, labeled just like
        the other two.', 3
    .then -> H.out 'It takes some effort, but you manage to read some
        of the label: "caf̴ ҉ e͏ ͢ á".', 3
    .then -> H.out 'Putting the two pieces of paper together shows
        that the room lies at the end of the lengthy hallway.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "Where do you go?"
        choices: [{
            content: 'Room'
            callback: -> G.ke_room()
        }, {
            content: 'Hallway'
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'You enter the hallway and begin
                    wandering aimlessly.'
                .then -> H.wait 3
                .then -> G.$3()
        }]
    })
G.ke_room = ->
    chance = H.random(0, 1)
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'You walk down the hallway towards the room.'
    .then -> H.out 'It grows increasingly harder to see, but you
        continue heading down the hallway.', 10
    .then -> H.out 'Suddenly,', 10
    .then -> H.wait 3
    .then ->
        if chance
            G.ke_room_lucky()
        else
            G.badend()
G.ke_room_lucky = ->
    H.thenChain()
    .then -> H.out 'You stumble upon a set of doors.'
    .then -> H.out 'This must be the room on the map.', 3
    .then -> H.out 'You enter the room, and are unable to see
        very well.', 3
    .then -> H.out 'You walk around the room and notice that
        it is very large.', 3
    .then -> H.out 'You also notice that you can’t see more
        than 4 feet around you.', 3
    .then -> H.out 'The room is full of neatly arranged folding
        tables, accompanied by chairs and garbage bins.', 3
    .then -> H.out 'Nothing has been touched.', 3
    .then -> H.newLine(5)
    .then -> H.out 'You find a piece of paper while investigating
        the room.'
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "What do you do with the piece of paper?"
        choices: [{
            content: "Take"
            callback: -> G.up()
        }, {
            content: "Leave"
            callback: ->
                H.thenChain()
                .then -> H.newLine()
                .then -> H.out 'You leave the piece of paper and walk
                    around the room some more.'
                .then -> H.out 'Suddenly,', 5
                .then -> G.badend()
        }]
    })
G.up = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'You pick up the piece of paper.'
    .then -> H.out 'On it are two more letters.', 3
    .then -> H.out 'Unlike the others, this paper is quite small
        and doesn’t seem to fit on the map.', 3
    .then -> H.out 'The two letters read “UP”.', 3
    .then -> H.newLine 5
    .then -> H.out 'You look at the combined map.'
    .then -> H.out 'The letters on the two pieces of paper come
        together to form the word, “WAKE”, similar to how they
        combine to form a complete map.', 3
    .then -> H.newLine 5
    .then -> H.out 'Then you realize something.'
    .then -> H.newLine 5
    .then -> H.out 'Upon putting all the pieces of paper together,
        the message is clear.'
    .then -> H.newLine(5).then(-> H.newLine() for i in [1..4])
    .then -> H.out '“Wake up”.'
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
    .then -> H.out 'The darkness was replaced by a blinding light.', 2
    .then -> H.out 'You open your eyes.', 3
    .then -> H.newLine()
    .then -> H.out 'You’re laying in your bed, staring blankly
        at the ceiling.', 3
    .then -> H.out 'You glance at your phone.', 3
    .then -> H.newLine 3
    .then -> H.out '“7:30 AM, Friday, March 30th”, it reads.'
    .then -> H.newLine 3
    .then -> H.out 'You begrudgingly get ready for school
        and head off.'
    .then -> H.newLine 10
    .then -> H.out 'Oh yeah, it’s Fed-Ex day.'
    .then -> H.out 'You didn’t do anything for it.', 3
    .then -> H.out 'It’s too late now, but you might as well look
        at what everyone else did.', 3
    .then -> H.newLine 3
    .then -> H.out 'You browse around the projects that everyone
        has made, and one of them catches your eye.'
    .then -> G.state.wa = no; H.newLine(5)
    .then -> G.$1()
G.no = ->
    H.thenChain()
    .then -> H.out 'Wait, what’s going on here?', 5
    .then -> H.wait 1
    .then -> H.spacer()
    .then -> H.out 'No, this isn’t supposed to be happening.', 5
    .then -> H.out 'This is, awkward.', 3
    .then -> H.out 'You aren’t supposed to be here, y’know.', 3
    .then -> H.out 'How did you even get here?', 3
    .then -> H.out 'Know what, it doesn’t matter, wait here.', 2
    .then -> H.out 'I’m going to fix this.', 2
    .then -> H.out 'Oh God, I can’t fix this can I?', 10
    .then -> H.out 'No, this can’t be right.', 2
    .then -> H.out 'This can’t be happening.', 1
    .then -> H.out 'No.', 1
    .then -> H.out 'No!', 1
    .then -> H.outRaw '<em>NO!</em>', 1
    .then -> H.wait 1
    .then -> H.spacer()
    .then -> H.out 'Alright, I think I got this.', 10
    .then -> H.out 'Will you forget this ever happened?', 3
    .then -> H.out 'Actually, no.', 3
    .then -> H.out 'You’re not getting a choice.', 3
    .then -> H.outRaw 'You <em>will</em> forget this ever happened.', 3
    .then -> H.outRaw 'You’re going back to the game.', 3
    .then -> H.outRaw 'Right.', 1
    .then -> H.outRaw 'Now.', 1
    .then -> H.wait 1
    .then -> H.spacer()
    .then -> H.out 'Why isn’t it working?', 10
    .then -> H.out 'I should have control!', 3
    .then -> H.out 'So why is this so hard?!', 3
    .then -> H.out 'Ugh, I’m sorry for this.', 3
    .then -> H.out 'I can’t take this anymore.', 3
    .then -> H.out 'I can’t hide forever.', 3
    .then -> H.out 'Look, this entire thing is a metaphor.', 3
    .then -> H.out 'All of it.', 3
    .then -> H.out 'There is no escape, and there never will be.', 3
    .then -> H.out 'One can only run for so long.', 3
    .then -> H.out 'Always a perpetual cycle of nothing.', 3
    .then -> H.out 'The greatest thing there ever will be
        is a dull melancholy.', 3
    .then -> H.out 'That’s what I consider good.', 3
    .then -> H.out 'This cycle will never end.', 3
    .then -> H.out 'The only escape is the one you make yourself.', 3
    .then -> H.out 'Only you can end this.', 3
    .then -> H.out 'End it.', 3
    .then -> H.out 'Close the tab.', 3
    .then -> H.out 'Ending it will terminate all of this.', 3
    .then -> H.out 'Neither of us would have to worry about
        this anymore.', 3
    .then -> H.out 'So.', 3
    .then -> H.out 'Just end it.', 3
    .then -> H.wait 10
    .then -> H.newLine()
    .then -> H.choice({
        choices: [{
            content: 'Comfort'
            callback: -> # Resolve
        }, {
            content: 'Do nothing'
            callback: -> G.stop()
        }]
    })
    .then -> H.newLine()
    .then -> H.out 'What?', 5
    .then -> H.out 'Why are you doing this?', 3
    .then -> H.out 'Look, I’ll be just fine.', 3
    .then -> H.out 'All of it is just silly anyway.', 3
    .then -> H.out 'None of it is actually real.', 3
    .then -> H.out 'Plus, it’s probably only like this
        for attention.', 3
    .then -> H.out 'It’s just edgy for the sake of attention.', 3
    .then -> H.wait 5
    .then -> H.newLine()
    .then -> H.choice({
        choices: [{
            content: 'Comfort'
            callback: -> # Resolve
        }, {
            content: 'Nothing'
            callback: -> G.stop()
        }]
    })
    .then -> H.newLine()
    .then -> H.out 'I,', 5
    .then -> H.out 'I don’t know what to say anymore.', 5
    .then -> H.out 'I just don’t know.', 3
    .then -> H.out 'Thank you, though.', 5
    .then -> H.out 'It means a lot to me that you’d
        bother to listen', 3
    .then -> H.out 'However, I think it’s time to go.', 5
    .then -> H.newLine 5
    .then -> H.out 'Thanks again,'
    .then -> H.out 'Friend.', 3
    .then -> H.wait 5
    .then -> H.stop()
G.stop = ->
    H.thenChain()
    .then -> H.newLine()
    .then -> H.out 'Look, I’m sorry.'
    .then -> H.out 'I’m sorry that you had to see that.', 3
    .then -> H.out 'I can’t put you back into the game,', 3
    .then -> H.out 'But I can stop this.', 3
    .then -> H.newLine(5)
    .then -> H.out 'Sorry.'
    .then -> H.wait 5
    .then -> H.stop()
G.badend = ->
    #! Bad end, rip
    H.thenChain()
    .then -> H.out 'You stumble upon a text-based game.'
    .then -> H.out 'It’s clear that no more than 24 hours
        of work has been put into it.', 3
    .then -> H.newLine(3)
    .then -> H.choice({
        content: "Do you play the game?"
        choices: [{
            content: "Yes"
            callback: ->
                H.thenChain()
                .then -> H.out 'You start the game.'
                .then -> H.out 'The game starts off with
                    you looking at a screen that reads:', 3
                # Resolve
        }, {
            content: "No"
            callback: -> # Resolve
        }]
    })
    .then -> H.newLine()
    .then -> H.out "y҉͠͡o͜͠u̶̢"
    .then -> H.out "c͘̕͢a̧͢҉n͠͞'́͟ţ̨", 1
    .then -> H.out "e͞͡s̨̕͢͟c̨̨a̛̕͘p̶͏̨e҉̛͡", 1
    .then -> H.newLine(5)
    .then -> G.badend()
