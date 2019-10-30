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
 * Servlet implementation class update_employee2
 */
@WebServlet("/update_employee2")
public class update_employee2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_employee2() {
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
		String employe_id1= request.getParameter("employee_id1");
		String sno= request.getParameter("sno");
		String admin_access= request.getParameter("admin_access1");
		String password= request.getParameter("password");
		
		
		String update_button= request.getParameter("update");
		String remove_button= request.getParameter("remove");
		System.out.print(employe_id1+" employ id of button");
		if(remove_button==null)
		{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			// updating value value 
			stm.executeUpdate("update employee_data set employee_id='"+employe_id1+"',admin_access='"+admin_access+"',password='"+password+"'  where   sno='"+sno+"'");
			//inserting value
			//stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
			//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			response.sendRedirect("admin_master.jsp");
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
		}
		else if (update_button==null)
		{
			try {
				
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
				Statement stm= con.createStatement();
				// updating value value 
				stm.executeUpdate("delete from employee_data where sno='"+sno+"'");
				//inserting value
				//stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
				//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

				response.sendRedirect("edit-employe-admin.jsp");
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
		}
	}

}
