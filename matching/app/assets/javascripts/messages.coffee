# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).load(->
h = $(window).height();
$("div box_srcollbar").css("height", h + "px");
);
$(window).resize(->
h = $(window).height();
$("div box_srcollbar").css("height", h + "px");
);
