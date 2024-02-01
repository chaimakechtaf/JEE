package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Forgot")
public class ForgotServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 


		     
		        String url="jdbc:mysql://localhost:3306/salon";
				String user="root";
				String passw="";
				String email = request.getParameter("email");
			    String password = request.getParameter("password");
				 
		        try {
		        	Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conn = DriverManager.getConnection(url, user, passw);
				
					PreparedStatement stmt=conn.prepareStatement("UPDATE client SET password = ? WHERE email = ?");
				
					    // Validate email and password
					   
					
					      stmt.setString(1, password);
					      stmt.setString(2, email);
					      int rowsUpdated = stmt.executeUpdate();
					      if (rowsUpdated == 0) {
					    	  request.setAttribute("errorMessage", "Email not found!");
					            request.getRequestDispatcher("Forgot.jsp").forward(request, response);
					      }
					    } catch (Exception e) {
							System.out.print(e);
					    
					    }
					    
					    // Redirect user to login page
					    response.sendRedirect("loginC.jsp");
					  }
}