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
 * Servlet implementation class update_employ
 */

public class update_employ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_employ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String update_button= request.getParameter("update");
		String insert_button= request.getParameter("insert");
		System.out.print(insert_button);
		System.out.print(update_button);
		if(update_button==null)
		{
			System.out.print(update_button);
			System.out.print(insert_button);
			String password = request.getParameter("password");
			String admin_access = request.getParameter("admin_access");
			int ac=Integer.parseInt(admin_access);
			String employ_id_table = request.getParameter("employ_id_table");
			int e_id=Integer.parseInt(employ_id_table);
				insert_method(password,ac,e_id);
		
		}
		else if (insert_button==null)
		{  System.out.print(update_button);
		System.out.print(insert_button);
			String password = request.getParameter("password");
			String admin_access = request.getParameter("admin_access");
			int ac=Integer.parseInt(admin_access);
			String employ_id_table = request.getParameter("employ_id_table");
			int e_id=Integer.parseInt(employ_id_table);
			
			update_method(password,ac,e_id);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
	void update_method(String password,int ac,int e_id)
	{
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
			Statement stm= con.createStatement();
			// updating value value 
			stm.executeUpdate("update employee_data set password='"+password+"',admin_access='"+ac+"'  where employee_id='"+e_id+"'");
			//inserting value
			//stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
			//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
	}
	void insert_method(String password,int ac,int e_id)
	{
		
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
				Statement stm= con.createStatement();
				// updating value value 
				//stm.executeUpdate("update employee_data set password='"+password+"',admin_access='"+ac+"'  where employee_id='"+e_id+"'");
				//inserting value
				stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
				//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

				
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
	}
}
