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
 * Servlet implementation class update_menu
 */

public class update_menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_menu() {
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
		HttpSession session=request.getSession();
		System.out.println(session.getAttribute("category_type"));
		String category_table = (String) session.getAttribute("category_type");
		String item_name_table= request.getParameter("item_name");
		String item_price_table= request.getParameter("item_price");
    	/*String item_no_price= request.getParameter("item_no");*/
		
    	
    	HttpSession session1=request.getSession();
		int item_no=(int)session1.getAttribute("item_no");
		String update_button= request.getParameter("update");
		String remove_button= request.getParameter("remove");
		System.out.println(update_button+" update ");
		System.out.println(remove_button+" remove ");
		if(remove_button==null)
		{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
			Statement stm= con.createStatement();
			// updating value value 
			stm.executeUpdate("update menu set item_name='"+item_name_table+"',item_price='"+item_price_table+"'  where category='"+category_table+"' and item_no='"+item_no+"'");
			//inserting value
			//stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
			//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			response.sendRedirect("searchmenu.jsp");
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
		}
		else if (update_button==null)
		{
			try {
				System.out.println(category_table+"category table");
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
				Statement stm= con.createStatement();
				// updating value value 
				stm.executeUpdate("delete from menu where item_no='"+item_no+"'");
				//inserting value
				//stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
				//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

				response.sendRedirect("searchmenu.jsp");
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
		}
	}

}
