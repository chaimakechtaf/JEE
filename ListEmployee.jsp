<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ListEmployees</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>

	<jsp:directive.include file = "html_includes/HeaderAdmin.html" />
	<center>
    <br>

<form action="SearcheEmploye" method="GET">
    <input type="text" name="query" placeholder=" search by name..."required>
    <button type="submit" value=""><i class="fas fa-magnifying-glass"></i></button>

  </form>
  <% String Message = (String) request.getAttribute("Message");
    if (Message != null) { %>
        <p style="color:red; "><%= Message %></p>
    <% } %>
  </center>
  
    

     <h1 class="text-center" style="margin-top:70px; text-align:center; color:#7529C0;">All Amployees</h1>
     
<div class="container-fluid table-responsive">
<table class=" table mt-5 shadow p-3 mb-5 bg-body rounded text-center;">
  <thead>
    <tr>
                    <th scope="col" style="color: black;">FULL NAME</th>			
					<th scope="col" style="color: black;">CIN</th>
					<th scope="col" style="color: black;">EMAIL</th>
					<th scope="col" style="color: black;">PHONE</th>
					<th scope="col" style="color: black;">SERVICE</th>
					
					<th scope="col" style="color: black;">Action</th>
  
    </tr>
  </thead>

  <%
String url="jdbc:mysql://localhost:3306/salon";
String user="root";
String password="";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, user, password);
	PreparedStatement pst=con.prepareStatement("SELECT * FROM employee");
 
ResultSet rs=pst.executeQuery();
while(rs.next()) {
	%>
	
	<tr>

<th><%=rs.getString(2)%></th>
<th><%=rs.getString(3)%></th>
<th><%=rs.getString(4)%></th>
<th><%=rs.getString(5)%></th>
<th><%=rs.getString(6)%></th>

<th><a href="DeleteEmployee?id=<%=rs.getInt(1)%>"><i class="fa-solid fa-trash"></i></a></th>

</tr>


	<%
}
rs.close();	
pst.close();
con.close();

}catch (Exception e){
	System.out.print(e);
}
%>
</table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>