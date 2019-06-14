
$(function() {
    var from = $( "#checkin" ).datepicker({
    	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
        minDate: 0,
        numberOfMonths: 2,
		onSelect: function(date) {
			var d = new Date(date);
			$("#checkout").datepicker("option", "minDate", new Date(d.getFullYear(),d.getMonth(), d.getDate() + eval(1)));
		}
      }) ;
   var to = $( "#checkout" ).datepicker({
    	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                        "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		numberOfMonths: 2
    });
   
   var from1 = $( "#sellCheckin" ).datepicker({
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
  var to1 = $( "#sellCheckout" ).datepicker({
   	dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
		monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", 
                       "8월", "9월", "10월", "11월", "12월"],	
		yearSuffix: "년",	
		showMonthAfterYear: true,	
		dateFormat: "yy-mm-dd",
		numberOfMonths: 2
   });
});

function increaseCnt() {
	var cnt = Number($("#rsvnCnt").val());
	cnt = isNaN(cnt) ? 1 : cnt;
	cnt++;
	$("#rsvnCnt").val(cnt);
}

function decreaseCnt() {
	var cnt = Number($("#rsvnCnt").val());
	cnt = isNaN(cnt) ? 1 : cnt;
	cnt < 2 ? cnt = 2 : cnt;
	cnt--;
	$("#rsvnCnt").val(cnt);
}

function sellRsvnSubmit() {
	$("#sellRsvnForm").submit();
}
