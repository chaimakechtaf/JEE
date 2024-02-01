<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>SMAC Beauty </title>
   
</head>

<body>
                	<jsp:directive.include file = "html_includes/HeaderClient.html" />


   
    <!-- Header Start -->
    <div class="jumbotron jumbotron-fluid bg-jumbotron" style="margin-bottom: 90px;">
        <div class="container text-center py-5">
            <h3 class="text-white display-3 mb-4">Hair removal</h3>
            <div class="d-inline-flex align-items-center text-white">
                <p class="m-0"><a class="text-white" href="acceuil.jsp">Home</a></p>
                <i class="far fa-circle px-3"></i>
                <p class="m-0"><a class="text-white" href="">hair removal</a></p>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <div class="container-xxl py-5">
        <div class="row mx-0 justify-content-center text-center">
            <div class="col-lg-6">
                <h6  class="d-inline-block bg-light  text-uppercase py-1 px-2">Our Service</h6>
                <h1>SMAC Beauty Services</h1>
            </div>
        </div>
            <div class="row g-4">
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="feature-item bg-light rounded text-center p-4">
                    <img src="img/1.jpg" style="width: 300px;height: 300px;margin-left:5px ; padding: 5px;">
                                            <br>
                       <h6  class="d-inline-block bg-light  text-uppercase py-1 px-2">Facial</h6>
                    
                       
                    </div>
                </div>
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="feature-item bg-light rounded text-center p-4">
<img src="img/2.jpg" style="width: 300px;height: 300px;margin-left:50px ; padding: 5px;"> 
                        <br>                    
                         <h6  class="d-inline-block bg-light  text-uppercase py-1 px-2">Arms</h6>
                       
                    </div>
                </div>
                <div class="col-lg-4 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="feature-item bg-light rounded text-center p-4">
   <img src="img/epilation.webp" style="width:300px;height: 300px;margin-left:5px ; padding: 5px;">
                        <br>
                        <h6  class="d-inline-block bg-light  text-uppercase py-1 px-2">Eyebrows</h6>
      
                    </div>
                </div>
            </div>
       
    </div>

 <!-- Open Hours Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row">
                <div class="col-lg-6" style="min-height: 500px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100" src="img/opening.jpg" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-6 pt-5 pb-lg-5">
                        <h6 class="d-inline-block text-white text-uppercase bg-primary py-1 px-2">Open Hours</h6>
                         <h1 class="mb-4">  SMAC  Beauty</h1>
 <p>Our salon is open for your convenience everyday at varying hours. </p>

 <p>Our hours of operation are designed to accommodate your busy schedule and ensure that you have the flexibility to book your appointment at a time that works best for you.</p>                        <ul class="list-inline">
                            <li class="h6 py-1"><i class="far fa-circle text-primary mr-3"></i>Everyday : 9:00 AM - 22:00 PM</li>
                  
                        </ul>
                        <a href="loginC.jsp" class="btn btn-primary mt-2">Reserve Now </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Open Hours End -->



      	<jsp:directive.include file = "html_includes/footer.html" />


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    
</body>

</html>