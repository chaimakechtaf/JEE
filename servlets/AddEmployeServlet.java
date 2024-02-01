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


@WebServlet("/AddEmployee")
public class AddEmployeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddEmployeServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		if(session.getAttribute("login")!=null) {
			
		String Fname=request.getParameter("Fname");
		String CIN=request.getParameter("CIN");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String service=request.getParameter("service");
		
		String url="jdbc:mysql://localhost:3306/salon";
		String user="root";
		String passw="";
		try {
			PrintWriter out = response.getWriter();

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, passw);
			PreparedStatement pst=con.prepareStatement("INSERT INTO employee (Fname,CIN,email,phone,service) VALUES (?,?,?,?,?)");
			
		pst.setString(1,Fname);
		pst.setString(2,CIN);
		pst.setString(3,email);
		pst.setString(4,phone);
		pst.setString(5,service);
        pst.executeUpdate();
        
        response.sendRedirect("ListEmployee.jsp");
        
		pst.close();
		con.close();

		}catch (Exception e){
			System.out.print(e);
		}
		}else  {
            // Si l'utilisateur n'est pas trouv�, affiche un message d'erreur
            request.setAttribute("errorMessage", "Erroor !");
            request.getRequestDispatcher("AddEmployee.jsp").forward(request, response);
        }     
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}