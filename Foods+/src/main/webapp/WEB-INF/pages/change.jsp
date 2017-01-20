<!DOCTYPE html>
<html>

<head>
  <title>Edit cafe</title>
  <link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/change-style.css"/>
</head>

<body onload="loadCafe()">
<div class="header">
  <img src="/Foods-1.0-SNAPSHOT/resources/pictures/logo.jpg">
</div>

<div class="wrapper">
  <form id="editCafeForm" class="newCafeForm" name="userDto"
        action="/Foods-1.0-SNAPSHOT/admin/change/save" method="post">
    <p>Edit cafe</p>

    <label><input id="id" name="id" type="text"></label>

    <p>Enter name:</p>
    <label><input id="name" name="name" type="text"></label>

    <p>Enter description:</p>
    <label><textarea id="description" name="description" rows="2"></textarea></label>

    <p>Enter middle sum:</p>
    <label><input id="middleCost" name="middleCost" type="text"></label>

    <p>Enter address:</p>
    <label><input id="address" name="address" type="text"></label>

    <p>Enter contacts:</p>
    <label><input id="contacts" name="contacts" type="text"></label>

    <p>Enter type (additional):</p>
    <label><input id="type" name="type" type="text"></label>


    <label><input id="x" name="x" type="text"></label>
    <label><input id="y" name="y" type="text"></label>


    <input type="submit" value="Ok">

  </form>
</div>

<div class="footer">
</div>

<script>

  function loadCafe(){
    var pathArray = window.location.pathname.split("/");
    var id = pathArray[pathArray.length - 1];

    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/Foods-1.0-SNAPSHOT/admin/change/" + id + "/getCafe", true);
    xhr.send();

    xhr.onreadystatechange = function(){
      if(xhr.status == 200 && xhr.readyState == 4){
        loadCafeInForm((JSON.parse(xhr.responseText.toString())));
      }
    }
  }

  function loadCafeInForm(cafe){
    console.log(cafe);

    var id = document.getElementById("id");
    id.style.display = "none";
    id.value = cafe["id"];

    var name = document.getElementById("name");
    name.value = cafe["name"];

    var description = document.getElementById("description");
    description.value = cafe["description"];

    var middleCost = document.getElementById("middleCost");
    middleCost.value = cafe["middleCost"];

    var address = document.getElementById("address");
    address.value = cafe["address"];

    var contacts = document.getElementById("contacts");
    contacts.value = cafe["contacts"];

    var type = document.getElementById("type");
    type.value = cafe["type"];

    var x = document.getElementById("x");
    x.style.display = "none";
    x.value = cafe["x"];

    var y = document.getElementById("y");
    y.style.display = "none";
    y.value = cafe["y"];
  }

</script>

</body>
</html>
