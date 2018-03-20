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
//= require bootstrap
//= require jquery.turbolinks
//= require 'rest_in_place'
//= require best_in_place
//= require jquery_ujs
//= require jquery-ui/sortable
//= require jquery-ui/effect-highlight
//= require jquery-ui/tabs
//= require turbolinks
//= require nprogress
//= require nprogress-turbolinks
//= require lazyload
//= require update_artists_row_order
//= require update_works_row_order
//= require update_releases_row_order
//= require update_announcements_row_order
//= require update_customs_row_order
//= require update_researches_row_order
//= require update_showreels_row_order
//= require jquery.slicknav
//= require jquery.prettySocial
//= require imagesloaded
//= require jquery.easing-1.3
//= require jquery.royalslider.min
//= require underscore
//= require FB_SDK
//= require lazysizes_rails
//= require fitvids.js
//= require plyr
//= require iscroll
//= require drawer
//= require jquery.jplayer.js

$(document).ready(function(){
	
	$(".change").on("ajax:success",function(){
	    location.reload();
	});
	
	$(".lazy").lazyload();
	
	$('.customBrandIcon').click(function(){
	    $('.subMenu').slideToggle('fast');
	});
	
	$('.customBrandIcon2').click(function(){
	    $('.subMenu2').slideToggle('fast');
	});
	$('.customBrandIcon3').click(function(){
	    $('.subMenu3').slideToggle('fast');
	});
	
	$('.envelopeDropdowner').click(function(){
	    $('.subMenu2').slideToggle('fast');
	});
	
	$('.envelopeDropdowner2').click(function(){
	    $('.subMenu3').slideToggle('fast');
	});
	
//	$('.my_iFrame').load(function() {
//		$('.loading').css('display', 'none');
//		$('.js #my_iFrame').css('visibility', 'visible');
//	});
	
//	$('.plyr').load(function() {
//	  	$('.loading').css('display', 'none');
//	  	$('.js #my_iFrame').css('visibility', 'visible');
//	});
	
	var position = 0
	$("#artistScrollPosition").animate({ scrollTop: window.position });
	$("#workScrollPosition").animate({ scrollTop: window.position });
	$("#releaseScrollPosition").animate({ scrollTop: window.position });
	
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
	
	$('.prettySocial').prettySocial();
	
	$('.responsiveVideo').fitVids();
	$('.responsiveVideo2').fitVids();
	
	var options = {clickToPlay: true, controls: ['fullscreen']}
	
	plyr.setup(document.querySelectorAll('.js-player'), options);
	
  	jQuery(".best_in_place").best_in_place();

	$('#myTabs a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show')
	});
	
	$('.drawer').drawer();
	if ($(window).width() < 991) { 
		$(".drawerMobileFix").addClass( "drawer--top" );
		$(".draw-left").hide();
		$(".draw-top").show();
	} else { 
		$(".drawerMobileFix").addClass( "drawer--left" );
		$(".draw-top").hide();
		$(".draw-left").show();
	}
	
	if ($(window).width() < 992) {
		$('.videoDesktop').hide();
		$('.videoMobile').show();
	}
	else {
	   	$('.videoDesktop').show();
		$('.videoMobile').hide();
	}
	
	$("a.push").click(function() {
		$("#rightpanel2").toggle( "slide" );
       	return false;
    }); 
	
	$( "#tabs" ).tabs();
	
});
$(function() {
	$("#works_search input").keyup(function(e) {
    	$.get($("#works_search").attr("action"), $("#works_search").serialize(), null, "script");
    	return false;
		e.PreventDefault()
  	});
	$("#releases_search input").keyup(function(e) {
    	$.get($("#releases_search").attr("action"), $("#releases_search").serialize(), null, "script");
    	return false;
		e.PreventDefault()
  	});
});
