$(document).on('turbolinks:load', function() {
    
    $(function(){
        $('.pagination a').attr('data-remote', 'true')
     });
    
    
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


    $('#myTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
      });
      
      // store the currently selected tab in the hash value
      $("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
        var id = $(e.target).attr("href").substr(1);
        window.location.hash = id;
      });
      
      // on load of the page: switch to the currently selected tab
      var hash = window.location.hash;
      $('#myTab a[href="' + hash + '"]').tab('show');

});