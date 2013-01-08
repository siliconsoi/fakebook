// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

(function($){
	$('.clear_text').on('click', clear);
	$('#create_post').on('submit', create_post);

	function clear(){
		$('textarea').val('');
	}

	function create_post(evt) {
		var $form = $(evt.currentTarget);

		evt.preventDefault();

		$.ajax({
			type: $form.attr('method'),
			url: $form.attr('action') + '.json',
			data: $form.serialize(),
			success: function(response){ update_feed(response.post); },
			error: function() { console.log(arguments); }
		});
		clear();
	}

	function update_feed(post) {

	}

}(jQuery));
