$(document).on('turbolinks:load', function() {
    var temp = 0;
    $(".choose-image").click(function(){
        temp++;
        $(".image-div").append(
                    `<div class="choose-image col-sm-3">
                        <div class="choose-file-field">
                            <span class="glyphicon glyphicon-plus"></span>
                            <input id="image-upload" type="file" name="album[images_attributes][`+ temp +`][image_link]"> 
                        </div>
                        <div class="choose-image-field">
                            <img id="img_prev" width=300 height=300 src="#" class="img-thumbnail"/>
                        </div>
                    </div>`
                );
    });
});
