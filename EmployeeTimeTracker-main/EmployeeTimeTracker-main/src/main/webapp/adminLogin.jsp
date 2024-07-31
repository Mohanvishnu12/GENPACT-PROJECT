<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <style>
    body {
      width: 100%;
    }
    .container {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      margin-top: 10%;
    }
    form {
      display: flex;
      flex-direction: column;
      justify-content: center;
      gap: 20px;
      height: 45vh;
      background: rgb(165, 67, 83);
      padding: 20px;
      border-radius: 10px;
      width: 25%;
    }
    h1 {
      text-align: center;
      color: #ffffff;
    }

    .input-box {
      position: relative;
    }
    .input-box input {
      padding: 10px;
      width: 95%;
      background: transparent;
      outline: none;
      border-bottom: 2px solid snow;
      border-left: none;
      border-right: none;
      border-top: none;
      color: white;
      font-size: 1.1rem;
      transition: 5s;
    }
    img{
        position: absolute;
        right: 5%;
        bottom: 10%;
        cursor: pointer;
    }

    input {
      padding: 10px;
      cursor: pointer;
      font-size: large;
      text-transform: capitalize;
      letter-spacing: 1px;
      font-weight: 400;
    }

    label {
      position: absolute;
      left: 0;
      bottom: 0;
      transition: 1s;
      color: #ffffff;
      font-size: 1.1rem;
      font-weight: 400;
      letter-spacing: 1px;
    }
    .input-box input:focus ~ label,
    .input-box input:valid ~ label {
      top: -15px;
    }
  </style>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Employee Time Tracker - Admin Login</title>
  </head>
  <body>
    <div class="container">
      <form action="AdminLoginServlet" method="post">
        <h1>Admin Login</h1>

        <div class="input-box">
          <input type="text" name="username" required />
          <label>Username</label>
          <img src="./assest/admin.svg" alt="">
        </div>
        <div class="input-box">
          <input type="password" name="password" required />
          <label>password</label>
          <img src="./assest/pws.svg" alt="">
        </div>
        <input type="submit" value="Login" />
      </form>
    </div>
  </body>
</html>
