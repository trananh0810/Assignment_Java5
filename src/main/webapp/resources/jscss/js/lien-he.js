// JavaScript Document
$(document).ready(function(){
	$('.btn-sendMess').click(function(){
		checkFeedbackLienHe();
	});
});

//check thông tin phản hổi liên hệ
function checkFeedbackLienHe(){
	var name	= $('#input-feedback-lienhe-name').val();
	var email	= $('#input-feedback-lienhe-email').val();
	var content	= $('#input-feedback-lienhe-content').val();
	
	var err_name = $('#small-err-name');
	var err_email = $('#small-err-email');
	var err_content = $('#small-err-content');
	
	if(name.length === 0){
		err_name.text('Vui lòng nhập tên của bạn!');
	} else {
		err_name.text('');
	}
	
	if(/^([\w\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{1})+$/.test(email) === false){
		err_email.text('Địa chỉ email không hợp lệ!');
	} else {
		err_email.text('');
	}
	
	if(content.length === 0){
		err_content.text('Vui lòng nhập nội dung!');
	} else {
		err_content.text('');
	}
}