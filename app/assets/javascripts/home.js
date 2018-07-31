$(document).on('turbolinks:load', function() {
    $('.show-albums').click(function () {
        if(!$('.show-albums').hasClass('change-to-blue')){
            $('.show-albums').addClass('change-to-blue')
            $('.show-photos').removeClass('change-to-blue')
        }
    });
    $('.show-photos').click(function () {
        if(!$('.show-photos').hasClass('change-to-blue')){
            $('.show-photos').addClass('change-to-blue')
            $('.show-albums').removeClass('change-to-blue')
        }
    });

    $.urlParam = function(name){
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        return results[1] || 0;
    }
    if($.urlParam('page_album_feeds') != null){
       $('.content-post-photos').removeClass('in active');
       $('.content-post-albums').addClass('in active');
    }
});