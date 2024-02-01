package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

@WebServlet("/Inscription")
public class SingUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String Cpassword=request.getParameter("Cpassword");
		
	
		if (!password.equals(Cpassword)) {
			System.out.println("Passwords do not match") ;
			response.sendRedirect("Inscription.jsp");
		}else response.sendRedirect("loginC.jsp");


		String url="jdbc:mysql://localhost:3306/salon";
		String user="root";
		String passw="";
		try {
			

			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passw);
					
			PreparedStatement pst=con.prepareStatement("INSERT INTO client (name, phone, email,username, password) VALUES(?,?,?,?,?)");
		pst.setString(1,name);
		pst.setString(2,phone);
		pst.setString(3,email);
		pst.setString(4,username);
		pst.setString(5,password);

		
        pst.executeUpdate();
	       response.sendRedirect("loginC.jsp");	
		pst.close();
		con.close();

		}catch (Exception e){
			System.out.print(e);
		}
}
}
