// $(function(){
// 	$('#comments').mouseover(function() {
//     $("#comments").css("background-color","yellow");
//     });
// });

$(function(){
	$(".comments").mouseenter(function(evt){
		$(this).css("background-color","#CBE0E3");
	}).mouseout(function(evt){
		$(this).css("background-color","");
	});
});