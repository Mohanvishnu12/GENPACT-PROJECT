<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>
  <head>
    <style>
      body{
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
      h1{
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
      }
      .input-box input::placeholder {
        color: white;
        font-size: 1.1rem;
      }
      input {
        padding: 10px;
        cursor: pointer;
        font-size: large;
        text-transform: capitalize;
        letter-spacing: 1px;
        font-weight: 400;
      }

      span {
        position: absolute;
        width: 0%;
        height: 3px;
        background: rgb(247, 134, 134);
        left: 0;
        bottom: 0;
        transition: 0.3s;
      }
      .input-box input:focus ~ span,
      .input-box input:valid ~ span {
        width: 100%;
        right: 0;
      }
    </style>
    <meta charset="ISO-8859-1" />
    <title>Employee Time Tracker - Employee Login</title>
  </head>
  <body>
    <div class="container">
      <form action="EmployeeLoginServlet" method="post">
        <h1>Employee Login</h1>
        <div class="input-box">
          <input type="text" name="username " placeholder="Username" required />
          <span></span>
        </div>
        <div class="input-box">
          <input
            type="password"
            name="password"
            placeholder="password"
            required
          />
          <span></span>
        </div>
        <input type="submit" value="login" />
      </form>
    </div>
  </body>
</html>
