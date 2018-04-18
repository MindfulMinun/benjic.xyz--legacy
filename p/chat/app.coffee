---
---
#! Initialize Firebase
firebase.initializeApp {
    apiKey: "AIzaSyC_UqviWuM55rcx907Zenhoyct4zkDtjpM"
    authDomain: "benji-chat.firebaseapp.com"
    databaseURL: "https://benji-chat.firebaseio.com"
    projectId: "benji-chat"
    storageBucket: "benji-chat.appspot.com"
    messagingSenderId: "263283748601"
}
# console.clear()

composer  = document.getElementById 'composer'
main      = document.getElementById 'main'
chatGroup = document.getElementById 'chat-group'
sendFab   = document.getElementById "send"

#! Autoresize
for el in document.querySelectorAll '.autoresize'
    timeout = null
    resize = (el) ->
        el.style.height = "0px"
        el.style.height = (el.scrollHeight) + "px"
        main.style.paddingBottom = el.parentNode.parentNode.scrollHeight + "px"

    el.addEventListener 'input', ->
        resize this
    window.addEventListener 'resize', ->
        if !timeout
            timeout = setTimeout ->
                resize el
            , 700
        else
            timeout = null

messageSendingHandler = ->
    if (composer.value.replace(/[\s]/g, "") isnt "")
        Chat.sendMessage {
            content: composer.value
            type: "text/message"
        }
        composer.value = null
        resize composer

composer.addEventListener "keypress", (e) ->
    if ((e.keyCode || e.which) is 13) and (not (e.shiftKey))
        e.preventDefault()
        messageSendingHandler()

send.addEventListener 'click', messageSendingHandler


window.Chat = {
    user: null #! User reference
    chatroom: null #! Chatroom ID
}

Chat.appendMessage = (message, user) ->
    # {
    #     type: "text/message", "text/slashMe", "text/info", "media/image", "media/url", "media/yt"
    #     content: "<Dependent on ^^^>"
    #     sender: "<uID>"
    #     #! NOTE: Never null.
    #     #! If "text/info", message invoker
    #     timestamp: <new Date()>
    #     data: {} #! Can be various things, mostly for media/*
    # }
    if not message or not message.type or not message.timestamp or not message.sender or not message.content
        return new Error "This isn’t a valid message."


    #! TODO: COMBAK: Code DRY, Don't repeat yourself
    msgContainer = null
    if message.type is "text/info"
        msgContainer = xyz.parseHTML """
            <div class="message-container" data-message-id="#{message.key}"
                title="Sent on #{new Date(message.timestamp).toLocaleString()}">
                <div class="message info">
                    <p>#{ twemoji.parse xyz.escapeHTML message.content }</p>
                </div>
            </div>
        """
    else if message.sender is Chat.user.uid
        msgContainer = xyz.parseHTML """
            <div class="message-container" data-message-id="#{message.key}"
                title="Sent on #{new Date(message.timestamp).toLocaleString()}">
                <div class="message right">
                    <p>#{ twemoji.parse xyz.escapeHTML message.content }</p>
                </div>
                <small class="right timestamp">&hellip;</small>
            </div>
        """
        db.ref "users/#{message.sender}"
        .once "value"
        .then (userSnapshot) ->
            msgContainer.querySelector "small.timestamp"
            .innerHTML = """
            #{userSnapshot.val().displayName} • #{
                xyz.time.formatDateTime new Date(message.timestamp)
            }
            """
    else if message.sender isnt Chat.user.uid
        msgContainer = xyz.parseHTML """
            <div class="message-container" data-message-id="#{message.key}"
                title="Sent on #{new Date(message.timestamp).toLocaleString()}">
                <div class="message left">
                    <p>#{ twemoji.parse xyz.escapeHTML message.content }</p>
                </div>
                <small class="left timestamp">&hellip;</small>
            </div>
        """
        db.ref "users/#{message.sender}"
        .once "value"
        .then (userSnapshot) ->
            msgContainer.querySelector "small.timestamp"
            .innerHTML = """
            #{userSnapshot.val().displayName} • #{
                xyz.time.formatDateTime new Date(message.timestamp)
            }
            """
    #! Append the message
    chatGroup.appendChild msgContainer
    #! Scroll
    main.scrollTop += msgContainer.scrollHeight

#! </ chat.appendMessage >

Chat.sendMessage = (message) ->
    # { // Expected format
    #     type: "text/message", "text/slashMe", "text/info", "media/image", "media/url", "media/yt"
    #     content: "<Dependent on ^^^>"
    #     sender: "<uID>"
    #     timestamp: <new Date()>
    #     data: {} #! Can be various things, mostly for media/*
    # }
    message.sender = Chat.user.uid
    message.timestamp = +new Date()

    if (Chat.chatroom is null)
        return xyz.toast {
            content: "Uhh, you gotta join a chatroom before sending messages."
            timeout: 7000
        }

    messageRef = db.ref("chats/#{Chat.chatroom}/messages").push()

    messageRef.set(message)

Chat.switchChatrooms = (chatId) ->
    #! Detach the listeners from the current chatroom
    db.ref("chats/#{Chat.chatroom}/messages").off "child_added"
    db.ref("chats/#{Chat.chatroom}/messages").off "value"

    #! Do the switch
    console.log "Hey, listen! Switched to chatroom #{chatId}"
    Chat.chatroom = chatId

    #! Close the drawer if open
    xyz.drawer.close()

    #! Clear the chat group
    chatGroup.innerHTML = ""
    chatTitle = document.getElementById "title"

    #! Append the messages as soon as they're recieved
    db.ref "chats/#{chatId}/messages"
    .on "child_added", (snapshot) ->
        val = snapshot.val()
        val.key = snapshot.key
        Chat.appendMessage val


    #! Update the title when it changes (it probably won't)
    db.ref "chats/#{chatId}/groupName"
    .on "value", (snapshot) ->
        title = snapshot.val()
        chatTitle.innerHTML = xyz.escapeHTML title
        document.title = "#{title} • Chat"



# Chat.appendMessage {
#     type: "text/info"
#     content: "Alice created a group chat and invited Bob, Carl, Dave, and 3 others."
#     sender: "0123456789"
#     timestamp: +new Date
# }
# Chat.appendMessage {
#     type: "text/message",
#     content: """
#         yo xd <>><><> lolollol ===/'"lmao
#
#         Two new lines
#     """,
#     sender: "1234567890",
#     timestamp: +new Date()
# }
# Chat.appendMessage {
#     type: "text/message",
#     content: "nice",
#     sender: "0123456789",
#     timestamp: +new Date()
# }


#! Firebase Database
db = firebase.database()

#! ==================================== !#
#! ========== Authentication ========== !#
#! ==================================== !#
(->
    #! Sign in section
    btns = [
        document.querySelector '[data-action="sign-in-google"]'
        document.querySelector '[data-action="sign-in-twitter"]'
    ]
    xyz.addEventListeners(btns, 'click', ->
        firebase.auth()
        .signInWithPopup new firebase.auth[this.dataset.provider + "AuthProvider"]()
        .then ->
            xyz.toast {content: "Logged in successfully"}
            xyz.drawer.open()
        .catch (err) ->
            xyz.toast {
                content: "Sign in error: #{err.message}"
                timeout: 7000
            }
    )
)()

(->
    #! Sign out
    for el in document.querySelectorAll '[data-action="log-out"]'
        el.addEventListener "click", ->
            firebase.auth().signOut()
            .then ->
                xyz.drawer.close()
            .catch (err) ->
                #! TODO: Create a different alert thing
                xyz.toast {
                    content: "Unable to sign out: #{err.message}"
                    timeout: 7000
                }
                window.location.reload()
)()

(->
    #! Link / Unlink accounts
    s = document.querySelector "#sign-in-provider-selector"
    link = document.querySelector '[data-action="link-sign-in-provider"]'
    unlink = document.querySelector '[data-action="unlink-sign-in-provider"]'

    link.addEventListener 'click', ->
        if s.value
            firebase.auth().currentUser.linkWithPopup new firebase.auth[s.value + "AuthProvider"]()
            .then ->
                xyz.toast {content: "Successfully linked provider"}
            .catch (err) ->
                xyz.toast {
                    content: "Couldn’t link provider: #{err.message}"
                    timeout: 7000
                }
    unlink.addEventListener 'click', ->
        if s.value
            firebase.auth().currentUser.unlink(s.value.toLowerCase() + ".com")
            .then ->
                xyz.toast {content: "Successfully unlinked provider"}
            .catch (err) ->
                xyz.toast {
                    content: "Couldn’t unlink provider: #{err.message}"
                    timeout: 7000
                }

)()

#! On auth...
firebase.auth().onAuthStateChanged (user) ->
    accountBox = document.querySelector ".side-nav .nav-box .account-box"
    if user
        #! Signed in
        #! Set Chat.user to this user
        Chat.user = user
        #! Update drawer ui
        accountBox.innerHTML = """
            <a href="#!" class="user-image">
                <img src="#{user.photoURL}" alt="#{user.displayName}">
            </a>
            <div class="user-info">
                <a href="#!">
                    <span class="username">#{user.displayName}</span>
                    <span class="email">#{
                        if user.email isnt null
                            "" + user.email + (if not user.emailVerified then "(not verified)" else "")
                        else "(No email address)"
                    }</span>
                </a>
                <a href="#!" class="switch-accounts"
                    aria-label="Switch Accounts">
                    <i class="material-icons">arrow_drop_down</i>
                </a>
            </div>
        """
        (-> #! More drawer UI
            myConvos = document.getElementById "nav--my-conversations"
            #! Get my list of conversations
            db.ref "users/#{Chat.user.uid}/memberOf"
            .on 'value', (snapshot) ->
                console.log "users/<uid>/memberOf", snapshot.val()
                for key, value of snapshot.val()
                    #! Grab the chatroom and display it on the side bar
                    db.ref "chats/#{key}"
                    .on "value", (snapshot) ->
                        anchor = document.querySelector "[data-chat-id='#{key}']"
                        if not anchor
                            #! If the anchor doesn't exist, add it.
                            anchor = xyz.parseHTML """
                                <a href="#" data-chat-id="#{key}">
                                    #{snapshot.val().groupName}:
                                    <span class="msg-preview trunc">&hellip;</span>
                                </a>
                            """
                            anchor.addEventListener "click", ->
                                Chat.switchChatrooms(anchor.dataset.chatId)
                            li = xyz.parseHTML("<li></li>")
                            li.appendChild anchor
                            myConvos.appendChild li
                        else
                            #! If it does, just update its contents
                            anchor.innerHTML = """
                                #{snapshot.val().groupName}: <span class="msg-preview trunc">&hellip;</span>
                            """
        )()

        console.log "Successfully logged in. User: ", user

        db.ref("users/" + user.uid + "/displayName").set(user.displayName)
        db.ref("users/" + user.uid + "/pfp").set(user.photoURL)
        #! Close the sign in dialog
        xyz.dialog.close '#dialog--log-in-or-sign-up.dialog-container'
    else
        #! Not logged in OR logged out, show dialog
        accountBox.innerHTML = """
            <a href="#!" class="user-image"></a>
            <div class="user-info">
                <a href="#!">
                    <span class="username">Not logged in.</span>
                    <span class="email">Some actions are unavailable.</span>
                </a>
                <a href="#!" class="switch-accounts"
                    aria-label="Switch Accounts">
                    <i class="material-icons">arrow_drop_down</i>
                </a>
            </div>
        """
        xyz.dialog.open '#dialog--log-in-or-sign-up.dialog-container'

(->
    #! Create new conversation
    createNewConvo = document.querySelector '[data-action="create-new-conversation"]'
    newConvoName = document.getElementById "new-conversation-name"
    createNewConvo.addEventListener 'click', (e) ->
        if (e.isTrusted isnt false)
            conversationRef = db.ref("chats").push()
            conversationRef.set {
                groupName: newConvoName.value
                groupImage: null
            }
            #! Set myself as a member and admin
            db.ref("chats/#{conversationRef.key}/members/#{firebase.auth().currentUser.uid}").set true
            db.ref("chats/#{conversationRef.key}/admins/#{firebase.auth().currentUser.uid}").set true

            #! Add this conversation to the list of chats I'm a member of
            db.ref("users/#{Chat.user.uid}/memberOf/#{conversationRef.key}").set true

            #! Switch to this chatroom
            Chat.switchChatrooms conversationRef.key

            #! Send the "Chatroom created" message
            Chat.sendMessage {
                type: "text/info"
                content: "Chatroom created by #{Chat.user.displayName}, at #{new Date().toUTCString()}"
            }

            #! Finally, close the conversation dialog
            xyz.dialog.close "#dialog--new-conversation"
)()

#! NOTE: When a bubble is added, main's scroll += message's height
# db.ref '/'
# .on 'value', (snapshot) ->
#     console.log snapshot.val(),
