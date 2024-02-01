package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/Reservation")
public class ReservS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReservS() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session=request.getSession();
	    String name=request.getParameter("name");
	    Integer phone = (int) Double.parseDouble(request.getParameter("phone"));     
	    String email=request.getParameter("email");
	    String brushing = request.getParameter("brushing");     
	    String coloration = request.getParameter("coloration");
	    String coupe = request.getParameter("coupe");
	    String manucure = request.getParameter("manucure");
	    String pedicure = request.getParameter("pedicure");
	    String gommage = request.getParameter("gommage");
	    String visage = request.getParameter("visage");
	    String bras = request.getParameter("bras");
	    String sourcils = request.getParameter("sourcils");
	    
	    // obtenir l'heure de la réservation depuis le champ DateTime
	    LocalDateTime reservationTime = LocalDateTime.parse(request.getParameter("date"));
	    
	    // définir les heures de travail de votre salon
	    int heureDebut = 9;
	    int minuteDebut = 0;
	    int heureFin = 22;
	    int minuteFin = 0;
	    
	    // vérifier si l'heure de la réservation est dans les heures de travail
	    if (reservationTime.getHour() >= heureDebut && reservationTime.getHour() < heureFin) {
	        // heure de réservation est entre les heures de travail
	        
	        // vérifier si l'heure de réservation est disponible
	        boolean isAvailable = true;
	        String url="jdbc:mysql://localhost:3306/salon";
	        String user="root";
	        String passw="";
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection(url, user, passw);
	            PreparedStatement pst=con.prepareStatement("SELECT * FROM reservation WHERE date >= ? AND date < ?");
	            pst.setObject(1, reservationTime);
	            pst.setObject(2, reservationTime.plusHours(1));
	            ResultSet rs = pst.executeQuery();
	            
	            if (rs.next()) {
	                // une réservation existe déjà pour cette heure
	                isAvailable = false;
	            }

	            rs.close();
	            pst.close();
	            con.close();

	        } catch (Exception e) {
	            System.out.print(e);
	        }
	        
	        if (isAvailable) {
	            // heure de réservation est disponible
	            
	            try {
	                Connection con = DriverManager.getConnection(url, user, passw);
	                PreparedStatement pst=con.prepareStatement("INSERT INTO reservation (name, phone, email, date,brushing,coloration,coupe,manucure,pedicure,gommage,visage,bras,sourcils) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	                pst.setString(1,name);
	                pst.setInt(2,phone);
	                pst.setString(3,email);
	                pst.setObject(4,reservationTime);
	                pst.setString(5,brushing);
	                pst.setString(6,coloration);
	                pst.setString(7,coupe);
	                pst.setString(8,manucure);
	                pst.setString(9,pedicure);
	                pst.setString(10,gommage);
	                pst.setString(11,visage);
	                pst.setString(12,bras);
	                pst.setString(13,sourcils);
	     
	                pst.executeUpdate();
	                response.sendRedirect("HomeClient.jsp");    

	                pst.close();
	                con.close();

	            } catch (Exception e) {
	                System.out.print(e);
	            }
	        } else {
	            // heure de réservation n'est pas disponible
	            request.setAttribute("errorMessage"," The time you selected is already used ! Please choose another time.");
	            request.getRequestDispatcher("Reservation.jsp").forward(request, response);    

}
	    } else {
            // heure de réservation n'est pas disponible
            request.setAttribute("errorMessage"," The time you selected is not available! Please choose another time.");
            request.getRequestDispatcher("Reservation.jsp").forward(request, response);    

	}
	}
}
