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
	$('.create_action').on('submit', create_action);

	function create_action(evt) {
		var $form = $(evt.currentTarget);

		evt.preventDefault($form.attr('action'));

		$.ajax({
				type: $form.attr('method'),
				url: $form.attr('action') + '.json',
				data: $form.serialize(),
				success: make_decision($form),
				error: function() { console.log(arguments); }
			});
		$('textarea').val('');
	}

	function make_decision($form) {
		return function(response) {
			if ($form.attr('action') == '/comments') {
				create_comment(response, $form.closest('.user_post_container'));
			} else {
				create_post(response);
			}
		};
	}

	function create_comment(response, $user_post_container) {
		$user_post_container.find('.user_post_comments').append(response.comment);
	}

	function create_post(response) {
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


// // ONE WAY /////////////////////////////////////////////////

(function($){
	$('#create_comment').on('submit', create_comment);

	function create_comment(evt) {
		var $form = $(evt.currentTarget);
		evt.preventDefault();
		// console.log($form.attr('action'));
		$.ajax({
			type: $form.attr('method'),
			url: $form.attr('action') + '.json',
			data: $form.serialize(),
			success: update_comment($form.closest('.user_post_container')),
			error: function() { console.log(arguments); }
		});
		$('textarea').val('');
	}

	function update_comment($post_container) {
		return function(response){
			$post_container.find('.user_post_comments').append(response.post);
		};
	}

}(jQuery));

// // ANOTHER WAY //////////////////////////////////////////


// (function($){
// 	$('#create_comment2').on('submit', create_comment);

// 	function create_comment(evt) {
// 		var $form = $(evt.currentTarget);
// 		evt.preventDefault();

// 		$.ajax({
// 			type: $form.attr('method'),
// 			url: $form.attr('action') + '.json',
// 			data: $form.serialize(),
// 			success: function(response){
// 				$form.closest('.user_post_container').find('.user_post_comments').append(response.post);
// 			},
// 			error: function() { console.log(arguments); }
// 		});
// 		$('textarea').val('');
// 	}

// }(jQuery));

// // YET ANOTHER WAY /////////////////////////////////////////////////

// (function($){
// 	$('#create_comment3').on('submit', create_comment);

// 	function create_comment(evt) {
// 		var $form = $(evt.currentTarget);
// 		evt.preventDefault();

// 		$.ajax({
// 			type: $form.attr('method'),
// 			url: $form.attr('action') + '.json',
// 			data: $form.serialize(),
// 			success: update_comment,
// 			error: function() { console.log(arguments); }
// 		});
// 		$('textarea').val('');

// 		function update_comment(response){
// 			$form.closest('.user_post_container').find('.user_post_comments').append(response.post);
// 		}

// 	}

// }(jQuery));
