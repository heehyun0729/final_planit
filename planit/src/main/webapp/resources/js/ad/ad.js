$(document).ready(function(){
	$(".table a").on("click", function(event){//모달 열기
		event.preventDefault();
		const src=$(event.target).parent().prop("href");
		$("#modalSrc").html('<iframe style="border: 0px; " src="' + src + '" width="1000px" height="820px"></iframe>');
		$("#clickMe").click();
	});
});		