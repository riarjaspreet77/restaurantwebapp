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
import javax.swing.JOptionPane;



/**
 * Servlet implementation class login
 */

public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		String employ_id=request.getParameter("employ_id");
		HttpSession session=request.getSession();
		session.setAttribute( "employ_id","employ_id");
		String password=request.getParameter("password");
		/*System.out.println(employ_id);
		System.out.println(password);*/
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
			Statement stm= con.createStatement();
			// inserting value 
			//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
			String query = "SELECT * FROM employee_data where employee_id='"+employ_id+"' and password='"+password+"' ";

			ResultSet rs = stm.executeQuery(query);
			if (rs.next())
				{   if(rs.getInt("admin_access")==0)
						{
							response.sendRedirect("cashier.jsp");
					
						}
					else
						{
						response.sendRedirect("admin.jsp");
						}
					
					
	      
				}
			else 
				{
				
				session.setAttribute( "error_msg","username/Password invalid");
				
				response.sendRedirect("login_page.jsp");
				}
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
		
	}

}
