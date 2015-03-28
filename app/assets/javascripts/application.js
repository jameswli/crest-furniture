// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery-ui

// Generic modal open/close code
$(document).ready(function() {
	$(".modal-link").click(function(event) {
		event.preventDefault();
		$("#modal-overlay").show();
		$( "div[ name='" + $(this).attr("name") + "']" ).slideDown();
	});

	$(".modal-close").click(function(event) {
		event.preventDefault();
		$(".modal-box").slideUp();
		$("#modal-overlay").hide();
	});
});
