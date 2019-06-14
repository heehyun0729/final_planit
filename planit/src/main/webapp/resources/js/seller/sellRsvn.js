var bgcolors = ['#113f67', '#34699a', '#408ab4', '#65c6c4', '#35477d', '#6c5b7b', '#c06c84', '#f67280'];

$(function() {
	$( "#sellCheckin" ).datepicker({
	   	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                       "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
       numberOfMonths: 2,
		onSelect: function(date) {
			var d = new Date(date);
			$("#sellCheckout").datepicker("option", "minDate", new Date(d.getFullYear(),d.getMonth(), d.getDate() + eval(1)));
		}
     }) ;
	  $( "#sellCheckout" ).datepicker({
	   	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                       "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		numberOfMonths: 2
	   });
	  
});

function sellRsvnSubmit() {  
	$("#sellRsvnForm").submit();
}