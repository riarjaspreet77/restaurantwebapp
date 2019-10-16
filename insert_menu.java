package restaurant_webapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class insertmenu
 */
@WebServlet("/insertmenu")
public class insert_menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_menu() {
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
	
		
	
		String item_name_table= request.getParameter("item_name");
		String item_price_table= request.getParameter("item_price");
		HttpSession session=request.getSession();
		String n=(String) session.getAttribute("category_type");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			// updating value value 
			//stm.executeUpdate("update employee_data set password='"+password+"',admin_access='"+ac+"'  where employee_id='"+e_id+"'");
			//inserting value
			stm.executeUpdate("insert into menu values(null,'"+n+"','"+item_name_table+"','"+item_price_table+"')");
			//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
	}

}
