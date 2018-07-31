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
    
    function readURLPhoto(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
  
        reader.onload = function (e) {
          $('#img_prev'+i.toString()).attr('src', e.target.result);
          $('#img_prev'+i.toString()).addClass("up-index");
          $('.remove'+i.toString()).removeClass("hidden");
          i++;
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    var j=1;
    function readURLAlbum(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
  
        reader.onload = function (e) {
          $('.al_prev'+j.toString()).attr('src', e.target.result);
          $('.al_prev'+j.toString()).addClass("up-index");
          $('.remove'+j.toString()).removeClass("hidden");
          j++;
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    var divs = document.getElementsByClassName("choose-image");
    var divsAlbum = document.getElementsByClassName("choose-image-album");
    $(".image-upload").change(function(){
        divs[i].classList.remove('hidden');
        readURLPhoto(this);
    });
    $(".image-upload-album").change(function(){
      divsAlbum[j].classList.remove('hidden');
      readURLAlbum(this);
    });

    function readURLAvatar(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          $('#avatar_prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    $("#avatar-upload").change(function(){
        readURLAvatar(this);
    });
});
