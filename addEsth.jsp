<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" %>
    <%@ page import="java.sql.*" %>
    
   
<!DOCTYPE html>
<html>
<head>
	<title>Home Admin</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel>

    

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
   
</head>
<body>
    	<jsp:directive.include file = "html_includes/HeaderAdmin.html" />
     	
<br><br><br><br><br><br>
   
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <script src="js/main.js"></script>
<br><br>
	<div class="container">
	<h1>Esthetique</h1>
	<form action="AddServletEsth" method="POST">
	
		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Name
					<br>
					<input class="thead-dark" placeholder="NameOfService" name="nom" required>
					</th>
					
					<th scope="col">Price
					<br>
					<input class="thead-dark" placeholder="PriceOfService" name="prix" required>
					
					</th>
				</tr>
			</thead>

<tr>
<br>
<td colspan="2">
<div align="center"><input type="submit" value="Add" ></div>
<div align="center"><input type="reset" value="Cancel" ></div>
</td>


</tr>

</table>
</form> 
</div>
</body>
</html>