// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery-validate-min
//= require jquery-validation
//= require_tree .


function clearFileInputField(tagId) {

    document.getElementById(tagId).innerHTML =

        document.getElementById(tagId).innerHTML;

}

function clearFileNewAlbum(k){
    var divOne = document.getElementsByClassName("choose-image"+k.toString());
    divOne[0].classList.add("hidden");
    clearFileInputField('choose-file-field-to-new'+k.toString());
}

function clearFileEditAlbum(k){
    var divOne = document.getElementsByClassName("choose-image"+k.toString());
    divOne[0].classList.add("hidden");
    clearFileInputField('choose-file-field-to-edit'+k.toString());
}

