$(document).on('turbolinks:load', function() {
    // var temp = 0;
    // $(".choose-image").click(function(){
    //     temp++;
    //     $(".image-div").append(
    //                 `<div class="choose-image col-sm-3">
    //                     <div class="choose-file-field">
    //                         <span class="glyphicon glyphicon-plus"></span>
    //                         <input id="image-upload3" class= "image-upload" type="file" name="album[images_attributes][2][image_link]"> 
    //                     </div>
    //                     <div class="choose-image-field">
    //                         <img id="img_prev3" width=300 height=300 src="#" class="img-thumbnail"/>
    //                     </div>
    //                 </div>`
    //             );
    // });

    var i = 1;
    
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
  
        reader.onload = function (e) {
          $('#img_prev'+i.toString()).attr('src', e.target.result);
          i++;
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    var j=1;
    var divs = document.getElementsByClassName("choose-image");
    $(".image-upload").change(function(){
        divs[i].classList.remove('hidden');
        j++;
        readURL(this);
    });
    // var j=1;
    // var divs = document.getElementsByClassName("choose-image");
    // $(".add-image-div").click(function(){
    //     divs[j].classList.remove('hidden');
    //     j++;
    // });
});
