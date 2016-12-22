<!DOCTYPE html>
<html>
  <head>
    <title>login</title>
    <link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/login-style.css">
  </head>

  <body>

  <div class="loginForm">
    <form name='f' action='/Foods-1.0-SNAPSHOT/login' method='POST'>
      <p>Login:</p>
      <label><input id="login" type="text" name="username"></label>

      <p>Password:</p>
      <label><input id="password" type="password" name="password"/></label>

      <div class="rememberMe">
        <label><input id="remember" type="checkbox"></label>
        <p>Remember me</p>
      </div>

      <input name="submit" type="submit" value="Login"/>
    </form>
  </div>

  </body>
</html>
