<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script async defer type="text/javascript"
	src="//maps.googleapis.com/maps/api/js?key=AIzaSyBJZmVpy1Zt3vbL5tusNVtcsJQnGjMLOQo&callback=initMap&libraries=places"></script>

<div id="planner">
	<div class="addrBox" id = "addrBox">
		<input type="text" id="address">
	</div>
	<div id="leftBox">
		<h1>플래너</h1>
		<p>
			출국: <input type="text" id="startDate">
		</p>
		<div id="route"></div>
	</div>
	<div id="map"></div>
</div>