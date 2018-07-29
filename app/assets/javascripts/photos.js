$(document).on('turbolinks:load', function() {
    $("img_prev").error(function(){
        $(this).hide();
    });
});