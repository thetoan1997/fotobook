$(document).on('turbolinks:load', function() {
    $('.show-albums, .show-photos').click(function () {
        $('.show-albums').toggleClass('change-to-blue')
        $('.show-photos').toggleClass('change-to-blue')
    })
});