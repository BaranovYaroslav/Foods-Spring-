<!DOCTYPE html>
<html>
  <head>
    <title>Admin page</title>
    <link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/admin-style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  </head>

  <body>

    <div class="header">
      <img src="/Foods-1.0-SNAPSHOT/resources/pictures/logo.jpg">
    </div>

    <div class="wrapper">

      <div class="leftBar">

        <div class="leftBarElement">
          <form id="newCafeForm" action="/Foods-1.0-SNAPSHOT/admin/new">
            <p id="newCafe">New cafe</p>
          </form>
        </div>

        <div class="leftBarElement">
            <p id="cafes">See cafes</p>
        </div>

        <div class="leftBarElement">
          <form id="logoutForm" action="/Foods-1.0-SNAPSHOT/admin/logout">
            <p id="logout">Logout</p>
          </form>
        </div>

      </div>

      <div class="content">
        <div id="cafesDiv"></div>
      </div>

    </div>

    <div class="footer">
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
      var cafesDiv = document.getElementById("cafesDiv");

      while(cafesDiv.firstChild){
        cafesDiv.removeChild(cafesDiv.firstChild);
      }

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

        var change = document.createElement("button");
        change.innerHTML = "Change";
        change.onclick = function(){
          changeCafe(this.parentNode);
        };
        cafe.appendChild(change);

        cafesDiv.appendChild(cafe);
      }
    }

    function changeCafe(cafe){
      console.log(cafe);
    }

    $(document).ready(function(){
      $("#newCafe").on({
        click: function (){
          $("#newCafeForm").submit();
        }
      });

     $("#cafes").on({
        click: function() {
          getCafes();
        }
      });

      $("#logout").on({
        click: function (){
          $("#logoutForm").submit();
        }
      });
    })
  </script>
  </body>
</html>
