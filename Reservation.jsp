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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Reservation Formulaire</title>
    
</head>
<body>
<%
String Username = (String) session.getAttribute("username");

String sql = "SELECT name,phone,email FROM client WHERE username=?";
try {
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/salon", "root", "");
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, Username);
    ResultSet rs = pstmt.executeQuery();
    if (rs.next()) {
        String name = rs.getString("name");
        Integer phone = rs.getInt("phone");
        String email = rs.getString("email");

        %>
                	<jsp:directive.include file = "html_includes/NavbarClient.html" />
                	


    <div class="container">
        <div class="col-lg-8 m-auto shadow p-3 mb-5 bg-body rounded mt-5">
            <h1 class="text-center" style="color: #ef9a9a;">Reservation</h1>
            
            <form class="row g-3 mt-2" action="ReservS" method="POST">
            
                <div class="col-md-6">
                  

	 

                  <label for="name" class="form-label">Full Name</label>
                  <input name="name" type="text" class="form-control" id="validationDefault01" value="<%= rs.getString("name") %>" >
      
                </div>
                
                <div class="col-md-6">
                  <label for="phone" class="form-label">N° Phone</label>
                  <input name="phone" type="text" class="form-control" id="validationDefault02" placeholder="+212****" value="<%= rs.getString("phone") %>" >
               
                </div>
                <div class="col-md-6">
                   
                    <label for="validationDefault01" class="form-label">Email</label>
                    <input name="email" type="email" class="form-control" id="validationDefault01" value="<%= rs.getString("email") %>" placeholder="example@gmail.com" >
             </div>


                <div class="col-md-6"> 
                  <label for="date" class="form-label">Date</label>
                  <input name="date" type="datetime-local" class="form-control" id="validationDefault03" required>
                </div>
                
                
                <label for="exampleInputEmail1" class="form-label text-center text-black"><i class="fa-duotone fa-server"></i> SERVICE</label>
                <div class="col-md-4">
                    <label for="validationDefault04" class="form-label">Hairdressing</label>
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" name="brushing" value="Brushing">Brushing 30DH
                    </div>
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="coloration" value="Coloration">Coloration 150DH
                    </div>
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="coupe" value="Coupe">Haircut 30DH
                    </div>
                  </div>
                  <div class="col-md-4">
                      <label for="validationDefault04" class="form-label">Aesthetics</label>
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="manucure" value="Manucure">Manicure 40DH 
                      </div>
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="pedicure" value="Pedicure">Pedicure 30DH
                      </div>
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="gommage" value="Gommage">Scrub 30DH
                      </div>
                    </div>
                    <div class="col-md-4">
                      <label for="validationDefault04" class="form-label">Hair removal</label>
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="visage" value="Visage">Facial 50DH
                      </div>
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="bras" value="Bras">Arms 30DH
                      </div>
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"  name="sourcils" value="Sourcils">Eyebrows 20DH
                      </div>
                    </div>
               
                <div class="col-12">
                  <button class="btn btn-primary" type="submit">Reserve </button>
                </div>
               <% String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) { %>
        <p style="color:red;"><%= errorMessage %></p>
    <% } %>
              </form>
        </div>
    </div>
    <%
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>