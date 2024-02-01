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
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginC")
public class ClientLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String url="jdbc:mysql://localhost:3306/salon";
		String user="root";
		String pass="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pass);
			PreparedStatement pst=con.prepareStatement("SELECT username,password FROM client WHERE username=? AND password=?");
		pst.setString(1,username);
		pst.setString(2,password);
        ResultSet rs=pst.executeQuery();
        if(rs.next()) {
        	session.setAttribute("username", username);
        	response.sendRedirect("HomeClient.jsp");
         }else
   	 {
            // Si l'utilisateur n'est pas trouvé, affiche un message d'erreur
            request.setAttribute("errorMessage", "Username or password incorrect");
            request.getRequestDispatcher("loginC.jsp").forward(request, response);
        }        rs.close();	
		pst.close();
		con.close();

		}catch (Exception e){
			System.out.print(e);
		}
}
}
