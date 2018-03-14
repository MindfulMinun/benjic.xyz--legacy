(function() {
    //! ==================================== !//
    //! ========== Time Formatter ========== !//
    //! ==================================== !//
    'use strict';
    if (!Intl && Intl.DateTimeFormat) {return;}
    var time = document.querySelectorAll('time[datetime].i18n');
    for (var i = 0; i < time.length; i++) {
        var d = new Date(time[i].getAttribute('datetime'));
        var dateTimeFormatter = new Intl.DateTimeFormat([], {
            weekday: 'short',
            month: 'short',
            day: 'numeric',
            hour: 'numeric',
            minute: 'numeric'
        });
        //! Time: Thu, Jan 18, 6:16 pm ZZZ
        time[i].innerText = dateTimeFormatter.format(d).replace(/[AP]\.?M/g, function (match) {
            return match.toLowerCase();
        });
    }
}());
(function(id) {
    //! ================================== !//
    //! ========== Share Button ========== !//
    //! ================================== !//
    'use strict';
    var btn   = document.getElementById(id);
    var title = document.querySelector('meta[name="post:title"]').getAttribute('content');
    var text  = document.querySelector('meta[name="post:share-text"]').getAttribute('content');
    var url   = document.querySelector('meta[name="post:permalink"]').getAttribute('content');

    btn.addEventListener('click', function () {
        if (navigator.share) {
            navigator.share({
                title: title,
                text: text,
                url: url + location.hash + "?s=1"
            }).then(function () {
                //! Successful share
                alert("Shared successfully");
                ga('send', 'event', 'Share', 'Shared w/ Web Share API');
            }).catch(function (err) {
                //! Error sharing
                alert("Error, couldn't share.");
            });
        } else {
            // alert("Navigator.share not supported");
            prompt("Permalink:", url + location.hash + "?s=1");
            ga('send', 'event', 'Share', 'Shared Permalink');
        }
    });

}('share'));
(function() {
    //! ================================== !//
    //! ========== Header links ========== !//
    //! ================================== !//
    'use strict';
    var hs = document.querySelector('article.post-content')
    .querySelectorAll('h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]');
    
    [].forEach.call(hs, function (el) {

        //! Create some nodes
        var anchor = document.createElement('a');
        var elementClone = el.cloneNode(true);

        //! Set the node’s attributes
        anchor.href = "#" + el.id;
        anchor.classList.add('header-link');
        anchor.appendChild(elementClone);

        //! Add some event listeners
        anchor.addEventListener('click', function (event) {
            // debugger;
        });

        //! Insert the anchor
        //!     <parent>.insertBefore(<newNode>, <referenceNode>)
        el.parentElement.insertBefore(anchor, el);
        //! Finally, delete the old element
        el.parentElement.removeChild(el);
    });

}());
