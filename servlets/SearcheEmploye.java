package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/ListEmployee")
public class SearcheEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearcheEmploye() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Get search query from request parameter
	    String query = request.getParameter("query");
	    
	    // Set up database connection
	    String url = "jdbc:mysql://localhost:3306/salon";
	    String user = "root";
	    String password = "";
	    try {
		  Connection conn = DriverManager.getConnection(url, user, password);

	    // Construct SQL query and execute it
	    String sql = "SELECT Fname, CIN, email, phone,service FROM employee WHERE Fname LIKE '%" + query + "%'";
	    PreparedStatement stmt = conn.prepareStatement(sql);
	    ResultSet rs = stmt.executeQuery(sql);
	    
	    // Build HTML output with search results
	    StringBuilder sb = new StringBuilder();
	    sb.append("<html>");
	    sb.append("<head><title>Search Results</title></head>");
	    sb.append("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">\r\n"
	    		+ "	<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n"
	    		+ "	<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\"></script>\r\n"
	    		+ "	<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js\"></script>\r\n"
	    		+ "	    <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\r\n"
	    		+ "    <meta content=\"Free HTML Templates\" name=\"keywords\">\r\n"
	    		+ "    <meta content=\"Free HTML Templates\" name=\"description\">\r\n"
	    		+ "\r\n"
	    		+ "    <!-- Favicon -->\r\n"
	    		+ "    <link href=\"img/favicon.ico\" rel=\"icon\">\r\n"
	    		+ "\r\n"
	    		+ "    <!-- Google Web Fonts -->\r\n"
	    		+ "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n"
	    		+ "    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap\" rel=\"stylesheet\">\r\n"
	    		+ "\r\n"
	    		+ "    <!-- Font Awesome -->\r\n"
	    		+ "    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css\" rel=\"stylesheet\">\r\n"
	    		+ "\r\n"
	    		+ "    <!-- Libraries Stylesheet -->\r\n"
	    		+ "    <link href=\"lib/animate/animate.min.css\" rel=\"stylesheet\">\r\n"
	    		+ "    <link href=\"lib/owlcarousel/assets/owl.carousel.min.css\" rel=\"stylesheet\">\r\n"
	    		+ "    <link href=\"lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css\" rel=\"stylesheet\" />\r\n"
	    		+ "    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css\" rel>\r\n"
	    		+ "  <link rel=\"stylesheet\" href=\"${pageContext.request.contextPath}/css/font-awesome.min.css\">\r\n"
	    		+ "\r\n"
	    		+ "\r\n"
	    		+ "    <!-- Customized Bootstrap Stylesheet -->\r\n"
	    		+ "    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\r\n"
	    		+ "    <link href=\"css/style.css\" rel=\"stylesheet\">\r\n"
	    		+ "   ");
	    sb.append("<body>");
	   
	    sb.append("<h1 style=\"margin-top:98px; text-align:center; color:#7529C0;\">Results</h1>");
	    sb.append("<div class=\"container\">\r\n"
	    		+ "		<table class=\"table table-striped table-hover\">\r\n"
	    		+ "			<thead class=\"thead-dark\">\r\n"
	    		+ "				<tr>\r\n"
	    		+ "					<th scope=\"col\">Full Name</th>\r\n"
	    		+ "					<th scope=\"col\">CIN</th>\r\n"
	    		+ "					<th scope=\"col\">Email</th>\r\n"
	    		+ "					<th scope=\"col\">Phone</th>\r\n"
	    		+ "					<th scope=\"col\">Service</th>\r\n"
	    		+ "	\r\n"
	    		+ "				</tr>\r\n"
	    		+ "			</thead> \r\n");
	    if (rs.next()) {
	    	
	      sb.append("<tr>");
	      sb.append("<th>" + rs.getString("Fname")+"</th>");
	      sb.append("<th>" + rs.getString("CIN") + "</th>" );
	      sb.append("<th>" + rs.getString("email")+ "</th>" );
	      sb.append("<th>" + rs.getString("phone")+ "</th>");
	      sb.append("<th>" + rs.getString("service")+ "</th>");
	      
	     sb.append("</tr>");
	     
	    }else{
			 
			request.setAttribute("Message"," No results matched your search !"); 
			request.getRequestDispatcher("ListEmployee.jsp").forward(request, response);
	    	
	    }
	    sb.append("</table>");
	    sb.append("</body>");
	    sb.append("</html>");
	    String output = sb.toString();
	    
	    // Send HTML output as response
	    PrintWriter out = response.getWriter();
	    response.setContentType("text/html");
	    out.println(output);
	    
	    // Clean up database resources
	    rs.close();
	    stmt.close();
	    conn.close();
	  }catch (Exception e){
			System.out.print(e);
		}
}


}