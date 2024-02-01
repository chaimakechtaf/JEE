<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page language="java" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital@1&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>login page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Open+Sans:ital,wght@0,400;1,300&family=Shantell+Sans:wght@300&family=Tajawal:wght@400;500&display=swap');
        .title {
            text-transform: uppercase;
            font-size: 3em;
            font-weight: bold;
            text-align: center;
            letter-spacing: 1px;
        }

        .separator {
            width: 200px;
            margin-left: 130px;
            margin-bottom: 20px;
            height: 4px;
            background-color: #0F4A90;
            
        }
        .welcome-message {
            text-align: center;
            font-size: 1.1em;
            line-height: 28px;
            margin-bottom: 30px;
            color: #696969;
        }
        .login-form {
    width: 100%;
    display: flex;
    flex-direction: column;
    }

    .form-control {
        width: 100%;
        position: relative;
        margin-bottom: 10px;
    }
    input,
    button {
        border: none;
        outline: none;
        border-radius: 30px;
        font-size: 1.1em;
    }

    input {
        width: 100%;
        background: #e6e6e6;
        color: #333;
        letter-spacing: 0.5px;
        padding: 14px 64px;
    }

    input ~ i {
        position: absolute;
        left: 32px;
        top: 50%;
        transform: translateY(-50%);
        color: #888;
        transition: color   0.4s;
    }

    input:focus ~ i {
        color:#0F4A90;
    }

   </style>
</head>
<body style="font-family: 'Montserrat', sans-serif;">

    <div class="container">
        <div class="row " style="margin-top: 30px;">
           
            <div class="col-lg-5 m-auto shadow p-3 mb-5 bg-body rounded" >
                <div class="mb-3 text-center">
                    <img src="imgs/2020.png" alt="" srcset="" class="text-center" style="width: 200px;text-align: center;" >
                </div>
                <div class="separator"></div>
                <p class="welcome-message">Please, provide login credential to proceed and have access to all our services</p>
    
                <form class="login-form" action="ClientLog" method="POST">
                    <div class="form-control">
                        <input type="text" placeholder="Username" name="username" value="" required>
                        
                        <i class="fa-solid fa-envelope"></i>
                    </div>
                    <div class="form-control">
                        <input type="password" placeholder="Password" name="password" required>
                        <i class="fas fa-lock"></i>
                    </div>
                    
                    
                    <div class="mb-3 text-center">
                        <button type="submit" class="btn text-white" style="background-color: #0F4A90;color:white;width: 300px" >Log In</button>
                        <br>
                          <a href="Forgot.jsp"  class="btn text-black" style="color: red;"><u>Forgot password?</u></a>                      
                         <br>
                          <a href="Inscription.jsp"  class="btn text-black" style="background-color: #0F4A90;color:white;width: 300px">Sign Up</a>
                    
                    </div>

                </form>
                    
               <% String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) { %>
        <p style="color:red;"><%= errorMessage %></p>
    <% } %>
            </div>
        </div>
    </div>

</body>
</html>