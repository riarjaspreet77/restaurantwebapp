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
 * Servlet implementation class date
 */
@WebServlet("/date")
public class date extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public date() {
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
		String from_date=request.getParameter("from_date");
		String to_date=request.getParameter("to_date");
		System.out.println(from_date);
		System.out.println(to_date);
		int grand_total=0;
		int flag_search_date=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			// inserting value 
			//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
			String query = "SELECT * FROM master_table where date between '"+from_date+"' and '"+to_date+"'";

			ResultSet rs = stm.executeQuery(query);
			  
				while(rs.next())
				{flag_search_date=1;
					int total = rs.getInt("total");
					grand_total=grand_total+total;
				    
				    System.out.println(grand_total);
				  
				}
				System.out.print(grand_total +"grands");
				
			if(flag_search_date==0) 
				{
				System.out.println("nosdhgsfhfsh");
				}
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
	}

}
