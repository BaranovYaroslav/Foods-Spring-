<!DOCTYPE html>
<html>
	<head>
		<title>Foods+</title>
		<link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/index-style.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<style>
			#map {
				width: 800px;
				height: 500px;
				padding: 20px;
				display: none;
				position: fixed;
				margin-left: calc(100vw/2 - 400px);
				top: 100px;
				border: 2px solid #4d4d4d;
				border-radius: 5px;
				z-index: 999999;
				background-color: #616161;
				text-align: center;
			}

			#map p{
				margin-top: 10px;
				color: #bcbcbc;
			}

			#map input[type="button"]{
				width: 100px;
				height: 40px;
				margin-top: 15px;
				background-color: #bcbcbc;
				border: 2px solid #464646;
				border-radius: 3px;
			}

			#map input[type="button"]:hover{
				cursor: pointer;
			}

			#mapCanvas{
				width: 800px;
				height: 400px;
				position: relative;
			}

			#coordinates{
				font-size: 12px;
				float: left;
			}

			#cleanCoordinates{
				margin-left: 155px;
				font-size: 12px;
				color: red;
			}

			#cleanCoordinates:hover{
				cursor: pointer;
			}

		</style>
	</head>

	<body onload="getCafes()">
		<div class="header" id="header">
			<img src="/Foods-1.0-SNAPSHOT/resources/pictures/logo.jpg">
		</div>

		<div id="map">
			<div id="mapCanvas"></div>
			<p>Choose point for search cafes</p>
			<p id="current"></p>
			<input type="button" value="Cancel" onclick="closeMap()">
			<input type="button" value="Ok" onclick="saveCoordinates()">
		</div>

		<div class="wrapper" id="wrapper">
			<div class="leftBar">
				<form id="searchForm" name="searchForm">
					<p>Enter minimal sum:</p>
					<input id="min" type="text" name="min">

					<p>Enter maximal sum:</p>
					<label><input id="max" type="text" name="max"></label>

					<p>Select type:</p>
					<label><input id="meat" type="checkbox" name="meat"> Meat</label>
					<label><input id="vegetarian" type="checkbox" name="vegetarian"> Vegetarian</label>
					<label><input id="cakes" type="checkbox" name="cakes"> Cakes</label>

					<p>Choose location:</p>
					<img src="/Foods-1.0-SNAPSHOT/resources/pictures/map.png" onclick="showMap()">
					<p id="coordinates"></p>
					<p id="cleanCoordinates" onclick="deleteCoordinates()"></p>

					<input type="button" value="Search" onclick="getSearchedCafes()">
				</form>
			</div>
			<div class="content">
				<div id="cafes">
				</div>
			</div>
		</div>

		<div class="footer" id="footer">
			<div class="redirectToAdminPagTitle">
				<form id="redirectForm" method="GET" action="/Foods-1.0-SNAPSHOT/redirectToAdmin">
					<p onclick="redirectToAdmin()">Enter as admin</p>
				</form>
			</div>
		</div>

		<script>
			function getCafes(){
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/Foods-1.0-SNAPSHOT/cafes", true);
				xhr.send();

				xhr.onreadystatechange = function(){
					if(xhr.status == 200 && xhr.readyState == 4){
						loadCafes(JSON.parse(xhr.responseText.toString()));
					}
				}
			}

			function loadCafes(cafes){
				var cafesDiv = document.getElementById("cafes");
				for(var i = 0; i < cafes.length; i++){
					var currentCafe = cafes[i];

					var cafe = document.createElement("div");
					cafe.className = "cafe";

					var name = document.createElement("p");
					name.innerHTML += "Name: " + currentCafe["name"];
					cafe.appendChild(name);

					var description = document.createElement("p");
					description.innerHTML += "Description:" + currentCafe["description"];
					cafe.appendChild(description);

					var middleCost = document.createElement("p");
					middleCost.innerHTML += "Middle cost: " + currentCafe["middleCost"];
					cafe.appendChild(middleCost);

					var address = document.createElement("p");
					address.innerHTML += "Address: " + currentCafe["address"];
					cafe.appendChild(address);

					var contacts = document.createElement("p");
					contacts.innerHTML += "Contacts: " + currentCafe["contacts"];
					cafe.appendChild(contacts);

					cafesDiv.appendChild(cafe);
				}
			}

			function redirectToAdmin() {
				var form = document.getElementById("redirectForm");
				form.submit();
			}

			function getSearchedCafes(){

				if(!validateMinAndMax()){
					alert("incorect");
				}

				else {
					var min, max;

					if(document.getElementById("min").value.length == 0){
						min = 0;
					}
					if(document.getElementById("max").value.length == 0){
						max = 999999;
					}

					if(min == undefined){
						min = document.getElementById("min").value;
					}
					if(max == undefined){
						max = document.getElementById("max").value;
					}

					var params = "min=" + min + "&max=" + max +
							"&position=" + encodeURIComponent(document.getElementById("coordinates").innerHTML) +
							"&meat=" + encodeURIComponent(document.getElementById("meat").checked + "") +
							"&vegetarian=" + encodeURIComponent(document.getElementById("vegetarian").checked + "") +
							"&cakes=" + encodeURIComponent(document.getElementById("cakes").checked + "");

					console.log(params);

					var xhr = new XMLHttpRequest();
					xhr.open("GET", "/Foods-1.0-SNAPSHOT/search?" + params, true);
					xhr.send();

					xhr.onreadystatechange = function () {
						if (xhr.status == 200 && xhr.readyState == 4) {
							reloadCafes(JSON.parse(xhr.responseText.toString()));
						}
					}
				}

			}

			function reloadCafes(cafes){
				var cafesDiv = document.getElementById("cafes");
				while(cafesDiv.firstChild){
					cafesDiv.removeChild(cafesDiv.firstChild);
				}
				loadCafes(cafes);
			}

			var map = null;
			var coordinates ='';
			function initMap() {
				map = new google.maps.Map(document.getElementById("mapCanvas"), {
					center: {lat: 50.449, lng: 30.525},
					zoom: 8
				});
				var marker = new google.maps.Marker({
					map: map,
					draggable: true,
					animation: google.maps.Animation.DROP,
					position: {lat: 50.449, lng: 30.525}
				});

				google.maps.event.addListener(marker, 'dragend', function (evt) {
					coordinates = 'Lat: ' + evt.latLng.lat().toFixed(3) + ' Lng: ' + evt.latLng.lng().toFixed(3) + '  ';
					document.getElementById('current').innerHTML = coordinates;
				});
			}

			function showMap(){
				if(map == null){
					initMap();
				}
				document.getElementById("map").style.display = "block";
				document.getElementById("header").style.opacity = "0.1";
				document.getElementById("wrapper").style.opacity = "0.1";
				document.getElementById("footer").style.opacity = "0.1";
				document.getElementById("map").style.opacity="1";
			}

			function closeMap(){
				document.getElementById("map").style.display = "none";
				document.getElementById("header").style.opacity = "1";
				document.getElementById("wrapper").style.opacity = "1";
				document.getElementById("footer").style.opacity = "1";
				document.getElementById('current').innerHTML = "";
			}

			function saveCoordinates(){
				document.getElementById("coordinates").innerHTML = coordinates;
				checkCoordinates();
				closeMap();
			}

			function checkCoordinates(){
				if(document.getElementById("coordinates").innerHTML.length != 0){
					document.getElementById("cleanCoordinates").innerHTML = '  ' + 'x';
				}
			}

			function deleteCoordinates(){
				if(	document.getElementById("cleanCoordinates").innerHTML.length > 0){
					document.getElementById("coordinates").innerHTML = "";
					document.getElementById("cleanCoordinates").innerHTML = "";
				}
			}

			function  validateMinAndMax(){
				var min = document.getElementById("min");
				var max = document.getElementById("max");

				console.log("in");

				if(min.value.length != 0){
					if(isNaN(parseInt(min.value)) || parseInt(min.value) != min.value){
						return false;
					}
				}
				if(max.value.length != 0 ) {
					if(isNaN(parseInt(max.value)) || parseInt(max.value) != max.value){
						return false;
					}
				}

				return true;
			}
		</script>
		<script async defer
				src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDsKmMo3J76lTSMoV3AQKviaPKJq62vTvY">
		</script>
	</body>

</html>
