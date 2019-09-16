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
 * Servlet implementation class search_menu
 */

public class search_menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search_menu() {
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
	String category=request.getParameter("category");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
			Statement stm= con.createStatement();
			// inserting value 
			//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
			String query = "SELECT * FROM menu where category='"+category+"' ";

			ResultSet rs = stm.executeQuery(query);
			if (rs.next())
				{  
					System.out.print("yes");
					int item_no = rs.getInt("item_no");
				    String item_name = rs.getString("item_name");
				    System.out.print(item_name);
				    System.out.print(item_no);
				    HttpSession session=request.getSession();
					session.setAttribute( "item_name",item_name);
					session.setAttribute( "item_no",item_no);
					session.setAttribute( "category",category);
					response.sendRedirect("menu_edit.jsp");
	      
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


