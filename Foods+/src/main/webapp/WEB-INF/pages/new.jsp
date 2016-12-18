<!DOCTYPE html>
<html>

  <head>
    <title>New cafe</title>
    <link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/new-style.css"/>
  </head>

  <body>
    <div class="header">
      <img src="/Foods-1.0-SNAPSHOT/resources/pictures/logo.jpg">
    </div>

    <div class="wrapper">
      <form class="newCafeForm" name="userDto" action="/Foods-1.0-SNAPSHOT/admin/new/save">
        <p>New cafe</p>

        <p>Enter name:</p>
        <label><input name="name" type="text"></label>

        <p>Enter description:</p>
        <label><textarea id="description" name="description" rows="2"></textarea></label>

        <p>Enter middle sum:</p>
        <label><input name="middleCost" type="text"></label>

        <p>Enter address:</p>
        <label><input name="address" type="text"></label>

        <p>Enter contacts:</p>
        <label><input name="contacts" type="text"></label>

        <p>Enter type (additional):</p>
        <label><input name="type" type="text"></label>

        <input type="submit" value="Ok">

      </form>
    </div>

    <div class="footer">
    </div>
  </body>
</html>
