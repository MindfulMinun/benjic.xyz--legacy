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
        time[i].innerText = dateTimeFormatter.format(d).replace(/[AP]M/gi, function (match) {
            return match.toLowerCase();
        });
    }
}());
(function() {
    //! ========================================= !//
    //! ========== Header-link wrapper ========== !//
    //! ========================================= !//
    'use strict';

}());
