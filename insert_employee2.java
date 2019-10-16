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
 * Servlet implementation class insert_employee2
 */
@WebServlet("/insert_employee2")
public class insert_employee2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insert_employee2() {
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

		String employye_id= request.getParameter("employye_id");
		String admin_access= request.getParameter("admin_access");
		String password= request.getParameter("password");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			// updating value value 
			//stm.executeUpdate("update employee_data set password='"+password+"',admin_access='"+ac+"'  where employee_id='"+e_id+"'");
			//inserting value
			stm.executeUpdate("insert into employee_data values(null,'"+employye_id+"','"+password+"','"+admin_access+"')");
			//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
	}

}
