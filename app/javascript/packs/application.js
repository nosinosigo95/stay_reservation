// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery_ujs
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function(){
    $('.drop_wrap').on('click', function(e){
        e.preventDefault();
        $('.drop_menu').toggle('active');
    });
    let url = window.location;
    $('a[href="'+url+'"]').css('color', 'orange');
});