<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        	    	<%@ page language="java" %>
<%@ page import="java.sql.*" %>
    
   
<!DOCTYPE html>
<html>
<head>
	<title>PROFILE</title>
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

   <%
String Username = (String) session.getAttribute("username");

String sql = "SELECT name,phone,email,username FROM client WHERE username=?";
try {
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/salon", "root", "");
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, Username);
    ResultSet rs = pstmt.executeQuery();
    if (rs.next()) {
        String name = rs.getString("name");
        Integer phone = rs.getInt("phone");
        String email = rs.getString("email");
        String Uname = rs.getString("username");

        %>
                	<jsp:directive.include file = "html_includes/NavbarClient.html" />
                	
	<!-- Profile -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <h3 class="text-center mb-4">Welcome <%= rs.getString("name") %> to your profile!</h3>
            <form action="" method="POST">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" name="name" id="name" class="form-control" value="<%= rs.getString("name") %>" disabled>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="phone" id="phone" class="form-control" value="<%= rs.getString("phone") %>" disabled>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" class="form-control" value="<%= rs.getString("email") %>" disabled>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" class="form-control" value="<%= rs.getString("username") %>" disabled>
                </div>
            </form>
        </div>
    </div>
</div> 
            
        <%
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
        
    </ul>
   
   </form>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
  
   
</body>
</html>