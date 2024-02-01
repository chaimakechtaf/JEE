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
import java.sql.ResultSet;

@WebServlet("/Login")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String login=request.getParameter("login");
		String password=request.getParameter("password");
		
		String url="jdbc:mysql://localhost:3306/salon";
		String user="root";
		String passw="";
		try {
			PrintWriter out=response.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passw);
			PreparedStatement pst=con.prepareStatement("SELECT id FROM admin WHERE login=? AND password=?");
		pst.setString(1,login);
		pst.setString(2,password);
        ResultSet rs=pst.executeQuery();
        if(rs.next()) {
        	session.setAttribute("login", login);
        	response.sendRedirect("AdminHome.jsp");
        }else
        	 {
                // Si l'utilisateur n'est pas trouvé, affiche un message d'erreur
                request.setAttribute("errorMessage", "Username or password incorrect");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }        rs.close();	
		pst.close();
		con.close();

		}catch (Exception e){
			System.out.print(e);
		}
}
}