
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#display').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);

        $("#display_file_name").val(input.files[0].name);
    }
}

$(function(){
	$('#ch-btn').on("click", function(){
		var e_filed = $('.email_field');
		 if ((e_filed.attr('disabled') == 'disabled')){
			 e_filed.attr("disabled", false);
		}else{
			 e_filed.attr("disabled", true);
		}
	});
});