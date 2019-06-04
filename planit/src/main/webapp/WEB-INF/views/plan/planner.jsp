<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=${sessionScope.key }&callback=initMap&libraries=places"></script>
<input type = "hidden" value = "${param.plan_num }" id = "plan_num">
<div id="planner">
	<div id="leftBox">
		<h1>플래너</h1>
		<div>
			출국 <input type="text" id="startDate">
		</div>
		<div id="route"></div>
	</div>
	<div id="map"></div>
	<div class="addrBox" id = "addrBox">
		<input type="text" id="address" class = "address">
	</div>
	<div class="saveBox" id = "saveBox">
		<input type="button" value = "저장" id="btnSave" class = "btnSave">
	</div>
</div>