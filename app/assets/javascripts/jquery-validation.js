$(document).on('turbolinks:load',function(){
    $(".new_user").validate({
        rules:{
            "user[firstname]":{
                required: true,
                maxlength: 25
            },
            "user[lastname]":{
                required: true,
                maxlength: 25
            },
            "user[email]":{
                required: true,
                email: true,
                maxlength: 255
            },
            "user[password]":{
                required: true,
                maxlength: 64
            }
        },
        messages:{
            "user[firstname]":{
                required:"Please enter your firstname.",
                maxlength:"Your firstname is too long. Make it at most 25 characters."
            },
            "user[lastname]":{
                required:"Please enter your lastname.",
                maxlength:"Your lastname is too long. Make it at most 25 characters."
            },
            "user[email]":{
                required:"Please enter your email address.",
                email: "Please enter a valid email address",
                maxlength:"Your email is too long. Make it at most 255 characters."
            },
            "user[password]":{
                required:"Please enter your password.",
                maxlength:"Your password is too long. Make it at most 64 characters."
            }
        }
    });

    $(".new_photo").validate({
        rules:{
            "photo[title]":{
                required: true,
                maxlength: 140
            },
            "photo[description]":{
                required: true,
                maxlength: 300
            }
        },
        messages:{
            "photo[title]":{
                required:"Please enter photo's title.",
                maxlength:"Photo's title is too long. Make it at most 140 characters."
            },
            "photo[description]":{
                required:"Please enter photo's description.",
                maxlength:"Photo's description is too long. Make it at most 300 characters."
            }
        }
    });

    $(".new_album").validate({
        rules:{
            "album[title]":{
                required: true,
                maxlength: 140
            },
            "album[description]":{
                required: true,
                maxlength: 300
            }
        },
        messages:{
            "album[title]":{
                required:"Please enter album's title.",
                maxlength:"Photo's title is too long. Make it at most 140 characters."
            },
            "album[description]":{
                required:"Please enter album's description.",
                maxlength:"Photo's description is too long. Make it at most 300 characters."
            }
        }
    });
});
