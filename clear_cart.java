package restaurant_webapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class clear_cart
 */
@WebServlet("/clear_cart")
public class clear_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clear_cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session1=request.getSession();
		String table_number_1=(String)session1.getAttribute("table_number");
		try {
			Class.forName("com.mysql.jdbc.Driver");

			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			
			
			// inserting value 
			stm.executeUpdate("insert into master_table(employ_id,table_no_1,item_name_1,item_price_1,quantity,total,date,time) SELECT employ_id,table_no,item_name,item_price,quantity,total,date,time FROM customer_data where table_no='"+table_number_1+"' ");
			//String query = "SELECT * FROM customer_data where table_no='"+table_number_1+"'  ";
			stm.executeUpdate("delete from customer_data where table_no='"+table_number_1+"'");
			
				
			response.sendRedirect("table_master.jsp");
		
		
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
	}

}
