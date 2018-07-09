###*
 * Lists all the variables in attached to the global scope (`window`)
 * @author MindfulMinun
 * @returns {object} - An object with all of the variables attached to `window`.
 * @since May 14, 2018
 * @version 1.0.0
###
xyz.vars = =>
    # coffeelint: disable=max_line_length
    # Very long string, I'm sorry.
    keys = "postMessage,blur,focus,close,frames,self,window,parent,opener,top,length,closed,location,document,origin,name,history,locationbar,menubar,personalbar,scrollbars,statusbar,toolbar,status,frameElement,navigator,applicationCache,customElements,external,screen,innerWidth,innerHeight,scrollX,pageXOffset,scrollY,pageYOffset,screenX,screenY,outerWidth,outerHeight,devicePixelRatio,clientInformation,screenLeft,screenTop,defaultStatus,defaultstatus,styleMedia,onanimationend,onanimationiteration,onanimationstart,onsearch,ontransitionend,onwebkitanimationend,onwebkitanimationiteration,onwebkitanimationstart,onwebkittransitionend,isSecureContext,onabort,onblur,oncancel,oncanplay,oncanplaythrough,onchange,onclick,onclose,oncontextmenu,oncuechange,ondblclick,ondrag,ondragend,ondragenter,ondragleave,ondragover,ondragstart,ondrop,ondurationchange,onemptied,onended,onerror,onfocus,oninput,oninvalid,onkeydown,onkeypress,onkeyup,onload,onloadeddata,onloadedmetadata,onloadstart,onmousedown,onmouseenter,onmouseleave,onmousemove,onmouseout,onmouseover,onmouseup,onmousewheel,onpause,onplay,onplaying,onprogress,onratechange,onreset,onresize,onscroll,onseeked,onseeking,onselect,onstalled,onsubmit,onsuspend,ontimeupdate,ontoggle,onvolumechange,onwaiting,onwheel,onauxclick,ongotpointercapture,onlostpointercapture,onpointerdown,onpointermove,onpointerup,onpointercancel,onpointerover,onpointerout,onpointerenter,onpointerleave,onafterprint,onbeforeprint,onbeforeunload,onhashchange,onlanguagechange,onmessage,onmessageerror,onoffline,ononline,onpagehide,onpageshow,onpopstate,onrejectionhandled,onstorage,onunhandledrejection,onunload,performance,stop,open,alert,confirm,prompt,print,requestAnimationFrame,cancelAnimationFrame,requestIdleCallback,cancelIdleCallback,captureEvents,releaseEvents,getComputedStyle,matchMedia,moveTo,moveBy,resizeTo,resizeBy,getSelection,find,webkitRequestAnimationFrame,webkitCancelAnimationFrame,fetch,btoa,atob,setTimeout,clearTimeout,setInterval,clearInterval,createImageBitmap,scroll,scrollTo,scrollBy,onappinstalled,onbeforeinstallprompt,crypto,ondevicemotion,ondeviceorientation,ondeviceorientationabsolute,indexedDB,webkitStorageInfo,sessionStorage,localStorage,chrome,visualViewport,speechSynthesis,webkitRequestFileSystem,webkitResolveLocalFileSystemURL,openDatabase,caches,google,TEMPORARY,PERSISTENT,addEventListener,removeEventListener,dispatchEvent".split ','
    # coffeelint: enable=max_line_length
    props = new Object null
    for key, value of this
        if key not in keys
            try
                props[key] = value
            catch
                props[key] = "[Error retrieving value]"
    props
