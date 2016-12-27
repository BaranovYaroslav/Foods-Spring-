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

        <form id="logoutForm" class="logoutForm" action="/Foods-1.0-SNAPSHOT/admin/logout">
          <p id="logout">Logout</p>
        </form>
      </div>

      <div class="content">
      </div>

    </div>

    <div class="footer">
    </div>

  <script>
    $(document).ready(function(){
      $("#logout").on({
        click: function (){
          $("#logoutForm").submit();
        },
        mouseenter: function(){
          $(this).css("text-decoration", "underline");
        },
        mouseleave: function(){
          $(this).css("text-decoration", "none");
        }
      })
    })
  </script>
  </body>
</html>
