<!DOCTYPE html>
<html>
  <head>
    <title>login1</title>
    <link rel="stylesheet" href="/Foods-1.0-SNAPSHOT/resources/login-style.css">
  </head>

  <body>

  <div class="loginForm">
    <form name='f' action='/Foods-1.0-SNAPSHOT/login' method='POST'>
      <p>Login:</p>
      <input id="login" type="text" name="username">

      <p>Password:</p>
      <input id="password" type="password" name="password"/>

      <div class="rememberMe">
        <input id="remember" type="checkbox">
        <p>Remember me</p>
      </div>

      <input name="submit" type="submit" value="Login"/>
    </form>
  </div>

  </body>
</html>
