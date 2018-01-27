(function() {
    //! ==================================== !//
    //! ========== Time Formatter ========== !//
    //! ==================================== !//
    'use strict';

    var time = document.querySelectorAll('time[datetime].i18n');

    if (!Intl && Intl.DateTimeFormat) {return;}
    // time = [];

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
    var btn = document.getElementById(id);
    var title = document.querySelector('meta[name="post:title"]').getAttribute('content');
    var text = document.querySelector('meta[name="post:share-text"]').getAttribute('content');
    var url = document.querySelector('meta[name="post:permalink"]').getAttribute('content');

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
