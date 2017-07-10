// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load',function(){
    
    $('.tab').tabs({
        swipeable:true
    });

    $('.tabs').tabs();

    $('.slider').slider({
        indicators:true,
        height:600,
    });

    $('select').material_select();

    $('.owl-carousel').owlCarousel({
        slideSpeed: 300,
        paginationSpeed: 400,
        loop: true,
        lazyLoad: true,
        margin: 10,
        items: 3,
        autoplay:true,
        autoplayTimeout:1000,
        autoplayHoverPause:true
    });

    var counter = 0;
    $("input, textarea").one('keypress',function(){
       if(counter<=0){
         $(".submit").append('<input class="red btn" type="submit" value="Save">');
             counter++
        }
    });
    $("#count").append(" 1 ");

});