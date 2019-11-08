// JavaScript Document
$(function(){
	$('.txtQuantity').change(function(){
		var soLuong = Number($(this).val());
		var donGia	= Number($(this).closest('.rowDSGH1').find('.pdonGia').text().replaceAll('.','').replace('đ',''));

		$(this).closest('.rowDSGH1').find('.pshowPrice').text((soLuong*donGia).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.")+"đ");
	
		tinhTongTien();
	});
})

// Replaces all instances of the given substring.
String.prototype.replaceAll = function(strTarget,strSubString){
	var strText = this;
	var intIndexOfMatch = strText.indexOf( strTarget );

	// Keep looping while an instance of the target string
	// still exists in the string.
	while (intIndexOfMatch !== -1){
	// Relace out the current instance.
	strText = strText.replace( strTarget, strSubString );

	// Get the index of any next matching substring.
	intIndexOfMatch = strText.indexOf( strTarget );
	}

	// Return the updated string with ALL the target strings
	// replaced out with the new substring.
	return( strText );
};

//Tính tổng tiền
function tinhTongTien(){
	var sumPrice = 0;
	$('.pshowPrice').each(function(){
		sumPrice += Number($(this).text().replaceAll('.','').replace('đ',''));
	});

	$('#pShowTongTienDSGH').text(sumPrice.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.")+"đ")
}