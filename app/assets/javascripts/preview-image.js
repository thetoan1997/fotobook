$(document).on('turbolinks:load', function() {
    var i = 0;
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
  
        reader.onload = function (e) {
          i++;
          $('#img_prev1').attr('src', e.target.result);
          $('#img_prev2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
  
    $("#image-upload").change(function(){
      $('#img_prev').removeClass('hidden');
      readURL(this);
    });

});