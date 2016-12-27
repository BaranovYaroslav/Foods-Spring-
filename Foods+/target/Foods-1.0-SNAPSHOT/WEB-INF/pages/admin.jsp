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
          <form id="logoutForm" action="/Foods-1.0-SNAPSHOT/admin/logout">
            <p id="logout">Logout</p>
          </form>
        </div>

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
        }
      });
      $("#newCafe").on({
        click: function (){
          $("#newCafeForm").submit();
        }
      })
    })
  </script>
  </body>
</html>
