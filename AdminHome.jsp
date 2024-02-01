<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home page</title>
    <link rel="stylesheet" href="./style_home.css">

</head>
<body>
<% 
    String username="";
    if(session.getAttribute("login")!=null){
    	username=session.getAttribute("login").toString();
    }else{
          response.sendRedirect("loginC.jsp");    
          }
    	%>
	<jsp:directive.include file = "html_includes/HeaderAdmin.html" />

 
                <h1 style="margin-top:60px; text-align:center; ">Welcome to <samp style="color:#7529C0;"><%=username %></samp> </h1>                

    <!-- Feature Start -->
    <div class="container-xxl py-4" style= margin-left:100px; baground-color=#7529C0 ; >
        <div class="container py-3 px-lg-2 ">
            <div class="row g-4">
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <img src="img/silhouette-de-visage-et-forme-de-cheveux-feminins.png" style="width: 200px;margin-left:30px ; padding: 5px;">
                       <h3  class="mb-3" style="margin-left:40px ; " >Hairdressing</h3>
                    
                </div>
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <img src="img/makeup.png" style="width: 200px;margin-left:30px ; padding: 5px;">
                           <h3 class="mb-3" style="margin-left:60px ;">Aesthetics</h3>
                         
                          </div>
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                        <img src="img/1997075.png" style="width: 200px;margin-left:30px ; padding: 5px;">
                            <h3  class="mb-3" style="margin-left:50px ">Hair removal</h3>
                       
                    </div>
                </div>
            </div>
        </div>
    
    <!-- Feature End -->

</body>

</html>