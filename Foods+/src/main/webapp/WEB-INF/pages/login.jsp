<!DOCTYPE html>
<html>
  <head>
    <title>login1</title>
  </head>

  <body>
  <h3>Login with Username and Password</h3>

  <form name='f' action='/Foods-1.0-SNAPSHOT/login' method='POST'>
        <label for="login">Login</label>
        <input id="login" type="text" name="username">
        <label for="password">Password</label>
        <input id="password" type="password" name="password"/>
        <input name="submit" type="submit" value="Login"/>
    </form>
  </body>
</html>
