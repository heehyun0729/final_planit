$(function() {
		$.datepicker.regional['calendar'] = {
			closeText : '닫기',
			prevText : '이전달',
			nextText : '다음달',
			currentText : '오늘',
			monthNames : [ '1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)',
					'5월(MAY)', '6월(JUN)', '7월(JUL)', '8월(AUG)', '9월(SEP)',
					'10월(OCT)', '11월(NOV)', '12월(DEC)' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			dateFormat : 'yy-mm-dd',
			minDate : 0,
			showMonthAfterYear : true,
			yearSuffix : '년',
			changeMonth : true,
			changeYear : true,
			yearRange : 'c-99:c+99',
			showButtonPanel : true
		}
		$.datepicker.setDefaults($.datepicker.regional['calendar']);

		$("#re_checkin").datepicker();

		$('#re_checkin').datepicker(
				"option",
				"onSelect",
				function(selectedDate) {
					$("#re_checkout").datepicker();
					$("#re_checkout").datepicker("option", "minDate",
							selectedDate);
				});
	});