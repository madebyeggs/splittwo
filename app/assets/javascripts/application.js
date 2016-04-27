// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require 'rest_in_place'
//= require best_in_place
//= require jquery_ujs
//= require jquery-ui/sortable
//= require jquery-ui/effect-highlight
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require lazyload
//= require update_artists_row_order
//= require update_works_row_order
//= require update_releases_row_order
//= require update_announcements_row_order
//= require jquery.slicknav
//= require jquery.prettySocial
//= require jquery.fitvids
//= require imagesloaded
//= require jquery.easing-1.3
//= require jquery.royalslider.min
//= require underscore
//= require gmaps/google
//= require FB_SDK

$(document).ready(function(){
	
	var position = 0
	$("#artistScrollPosition").animate({ scrollTop: window.position });
	$("#workScrollPosition").animate({ scrollTop: window.position });
	$("#releaseScrollPosition").animate({ scrollTop: window.position });
	
	$(".lazy").lazyload({
		effect : "fadeIn",
		threshold : 400
	});
	
	$(".clearFixer").click(function(){
		window.position = 0
	});
	
	$('.positionButtonArtist').click(function() {
		var id = $(this).prev('.modal-object-id').val();
		var artistPosition = $("#artistScrollPosition").scrollTop();
		window.position = artistPosition
	});
	
	$('.positionButtonWork').click(function() {
		var id = $(this).prev('.modal-object-id').val();
		var workPosition = $("#workScrollPosition").scrollTop();
		window.position = workPosition
	});
	
	$('.positionButtonRelease').click(function() {
		var id = $(this).prev('.modal-object-id').val();
		var releasePosition = $("#releaseScrollPosition").scrollTop();
		window.position = releasePosition
	});
	
	$('.closeIcon').click(function(){
		scrollToHere = window.position
	});
	
	if($(window).width() > 992){
    	$('.artist').hover(function(){
        	$(this).find('.info-wrapper').stop().slideDown('100');
        },
        function(){
        	$(this).find('.info-wrapper').stop().slideUp('100');
        });
    } else {
		$('.info-wrapper').show();
	}
	
	$('.delete_post').on('click', function() {
		if(confirm('Are you sure you want to delete this record')){
	    	return true
	    }else{
	        return false;
	    }
	});
	
	//mobileNavMenu
	$(function(){
		$('#menu').slicknav();
	});
	
	$('.prettySocial').prettySocial();
	
	$('.fitvids').fitVids();
	
  	jQuery(".best_in_place").best_in_place();
	
});