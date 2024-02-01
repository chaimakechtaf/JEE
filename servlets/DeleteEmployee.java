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


public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteEmployee() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		if(session.getAttribute("login")!=null) {
		
		int id=Integer.parseInt(request.getParameter("id"));
		String url="jdbc:mysql://localhost:3306/salon";
		String user="root";
		String passw="";
		try {
			PrintWriter out = response.getWriter();

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passw);
			
			PreparedStatement pst=con.prepareStatement("DELETE FROM employee where id=?");
		pst.setInt(1,id);
		
		
        pst.executeUpdate();
        response.sendRedirect("ListEmployee.jsp");
        
		pst.close();
		con.close();

		}catch (Exception e){
			System.out.print(e);
		}
		}else response.sendRedirect("Login.jsp") ;   
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

