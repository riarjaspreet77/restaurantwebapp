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
 * Servlet implementation class search_employ
 */

public class search_employ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search_employ() {
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
		String employ_id_search=request.getParameter("employ_id_search");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
			Statement stm= con.createStatement();
			// inserting value 
			//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
			String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			ResultSet rs = stm.executeQuery(query);
			if (rs.next())
				{  
					System.out.print("yes");
					int admin_access = rs.getInt("admin_access");
				    String password = rs.getString("password");
				    System.out.print(admin_access);
				    System.out.print(password);
				    HttpSession session=request.getSession();
					session.setAttribute( "password_found",password);
					session.setAttribute( "admin_access_found",admin_access);
					session.setAttribute( "employ_id_from_table",employ_id_search);
					response.sendRedirect("employ_edit.jsp");
	      
				}
			else 
				{
				System.out.print("nosdhgsfhfsh");
				}
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
	}

}
