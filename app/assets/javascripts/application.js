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

	function clear(){
		$('textarea').val('');
	}
}(jQuery));


(function($){
	$('#create_post').on('submit', create_post);

	function create_post(evt) {
		var $form = $(evt.currentTarget);

		evt.preventDefault();

		$.ajax({
			type: $form.attr('method'),
			url: $form.attr('action') + '.json',
			data: $form.serialize(),
			success: update_feed,
			error: function() { console.log(arguments); }
		});
		$('textarea').val('');
	}

	function update_feed(response) {
		$('#posts').prepend(response.post);
	}
}(jQuery));

(function($){
	$('#more_posts').on('click', more_posts);

function more_posts(evt) {
		var $button = $(evt.currentTarget);
		evt.preventDefault();
		$.ajax({
			url: $button.attr('href').replace(/\?/, '.json?'),
			success: update_feed,
			error: function() { console.log(arguments); }
		});
	}

	function update_feed(response) {
		$('#posts').append(response.post);
		$('#more_posts').attr('href', response.next_page);
	}
}(jQuery));



(function($){
	$('#create_comment').on('submit', create_comment);

	function create_comment(evt) {
		var $form = $(evt.currentTarget);

		evt.preventDefault();

		// $.ajax({
		// 	type: $form.attr('method'),
		// 	url: $form.attr('action') + '.json',
		// 	data: $form.serialize(),
		// 	success: update_comment,
		// 	error: function() { console.log(arguments); }
		// });
		// $('textarea').val('');
	}

	function update_coment(response) {
		// $('#posts').prepend(response.post);
	}
}(jQuery));
