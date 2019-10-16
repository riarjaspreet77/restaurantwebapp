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
 * Servlet implementation class update_category
 */
@WebServlet("/update_category")
public class update_category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_category() {
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
		
	
		String category_name= request.getParameter("category_name");
		
    	/*String item_no_price= request.getParameter("item_no");*/
		
    	
    
		String add_button= request.getParameter("add");
		String remove_button= request.getParameter("remove");
		System.out.println(add_button+" add ");
		System.out.println(remove_button+" remove ");
		if(remove_button==null)
		{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			// updating value value 
			//stm.executeUpdate("update menu set item_name='"+item_name_table+"',item_price='"+item_price_table+"'  where category='"+category_table+"' and item_no='"+item_no+"'");
			//inserting value
			stm.executeUpdate("insert into category values(null,'"+category_name+"')");
			//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

			response.sendRedirect("menu_edit2.jsp");
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
		}
		else if (add_button==null)
		{
			try {
				
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
				Statement stm= con.createStatement();
				// updating value value 
				stm.executeUpdate("delete from category where category_type='"+category_name+"'");
				//inserting value
				//stm.executeUpdate("insert into employee_data values(null,'"+e_id+"','"+password+"','"+ac+"')");
				//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

				response.sendRedirect("menu_edit2.jsp");
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
		}
	}

}
