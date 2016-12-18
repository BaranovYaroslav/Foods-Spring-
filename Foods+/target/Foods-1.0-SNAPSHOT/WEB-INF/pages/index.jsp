<!DOCTYPE html>
<html>
	<head>
		<title>Foods+</title>
		<link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/index-style.css"/>
	</head>

	<body onload="getCafes()">
		<div class="header">
			<img src="/Foods-1.0-SNAPSHOT/resources/pictures/logo.jpg">
		</div>

		<div class="wrapper">
			<div class="leftBar">
				<form>
					<p>Enter minimal sum:</p>
					<label><input type="text"></label>

					<p>Enter maximal sum:</p>
					<label><input type="text"></label>

					<p>Select type:</p>
					<label><input type="checkbox"> Meat</label>
					<label><input type="checkbox"> Vegetarian</label>
					<label><input type="checkbox"> Cakes</label>

					<p>Choose location:</p>
					<img src="/Foods-1.0-SNAPSHOT/resources/pictures/map.png">

					<input type="submit" value="Search">

				</form>
			</div>
			<div class="content">
				<div id="cafes">

				</div>
			</div>
		</div>

		<div class="footer">
			<div class="redirectToAdminPagTitle">
				<form id="redirectForm" method="GET" action="/Foods-1.0-SNAPSHOT/redirectToAdmin">
					<p onclick="redirectToAdmin()">Enter as admin</p>
				</form>
			</div>
		</div>

		<script>
			function getCafes(){
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "/Foods-1.0-SNAPSHOT/getCafe", true);
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
		</script>
	</body>

</html>