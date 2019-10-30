package restaurant_webapp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class quantity_update_admin
 */
@WebServlet("/quantity_update_admin")
public class quantity_update_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quantity_update_admin() {
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
		int quantity_table=0;
		HttpSession session=request.getSession();
		String category_type=(String)session.getAttribute("category_type");
		System.out.println(category_type);
		
		String table_number_1=(String)session.getAttribute("table_number");
		System.out.println(table_number_1);
		String add_button= request.getParameter("add");
		String remove_button= request.getParameter("remove");
		String item_name= request.getParameter("item_name");
		String item_price= request.getParameter("item_price");
		System.out.println(add_button);
		System.out.println(remove_button);
		System.out.println(item_name);
		System.out.println(item_price);
		int flag_item_there=0;
		int flag_quantity_zero=0;
		int total=0;
		int item_price_1;
		String employ_id=(String)session.getAttribute("employ_id");
		if(remove_button==null)
		{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			Statement stm= con.createStatement();
			// inserting value 
			//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
			String query = "SELECT * FROM customer_data where table_no='"+table_number_1+"' and item_name='"+item_name+"' ";

			ResultSet rs = stm.executeQuery(query);
			if (rs.next())
				{  
				flag_item_there=1;
				quantity_table=rs.getInt("quantity");
				total=rs.getInt("total");
				item_price_1=rs.getInt("item_price");
				total=total+item_price_1;
				quantity_table=quantity_table+1;
				System.out.print(flag_item_there);
				}
			else 
				{
				flag_item_there=0;
				System.out.print(flag_item_there);
				}
			}
			catch(Exception e)
			{ 
				System.out.println(e);
			}
		
		
		if(flag_item_there==1)
		{
			try {
				Date date = new Date();
				System.out.println(date.toString());
				SimpleDateFormat ft_date=new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat ft_time=new SimpleDateFormat("hh:mm:ss");
				String date11=ft_date.format(date);
				String time111=ft_time.format(date);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
				Statement stm= con.createStatement();
				// updating value value 
				stm.executeUpdate("update customer_data set quantity='"+quantity_table+"', total='"+total+"', date='"+date11+"', time='"+time111+"'  where table_no='"+table_number_1+"' and item_name='"+item_name+"'");
				//inserting value
				//stm.executeUpdate("insert into customer_data values('"+table_number_1+"','"+employ_id+"', null,0,1,'"+item_price+"','"+item_name+"')");
				//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

				
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
		}
		else 
		{
			try {
				Date date = new Date();
				System.out.println(date.toString());
				SimpleDateFormat ft_date=new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat ft_time=new SimpleDateFormat("hh:mm:ss");
				String date1=ft_date.format(date);
				String time11=ft_time.format(date);
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
				Statement stm= con.createStatement();
				// updating value value 
				//stm.executeUpdate("update employee_data set password='"+password+"',admin_access='"+ac+"'  where employee_id='"+e_id+"'");
				//inserting value
				stm.executeUpdate("insert into customer_data values('"+table_number_1+"',1, null,'"+item_price+"',1,'"+item_price+"','"+item_name+"','"+date1+"','"+time11+"')");
				//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

				
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
			
		}
		}
		
		else if(add_button==null)
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
				Statement stm= con.createStatement();
				// inserting value 
				//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
				String query = "SELECT * FROM customer_data where table_no='"+table_number_1+"' and item_name='"+item_name+"' ";

				ResultSet rs = stm.executeQuery(query);
				if (rs.next())
					{  
					flag_item_there=1;
					quantity_table=rs.getInt("quantity");
					total=rs.getInt("total");
					item_price_1=rs.getInt("item_price");
					total=total-item_price_1;
					quantity_table=quantity_table-1;
					if(quantity_table==0) {
						flag_quantity_zero=1;
					}
					System.out.print(flag_item_there);
					}
				else 
					{
					flag_item_there=0;
					System.out.print(flag_item_there);
					}
				}
				catch(Exception e)
				{ 
					System.out.println(e);
				}
			
			
			if(flag_item_there==1)
			{ if (flag_quantity_zero==0) {
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
					Statement stm= con.createStatement();
					// updating value value 
					stm.executeUpdate("update customer_data set quantity='"+quantity_table+"', total='"+total+"'  where table_no='"+table_number_1+"' and item_name='"+item_name+"'");
					//inserting value
					//stm.executeUpdate("insert into customer_data values('"+table_number_1+"','"+employ_id+"', null,0,1,'"+item_price+"','"+item_name+"')");
					//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

					
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}
			}
			else if (flag_quantity_zero==1)
			{
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
					Statement stm= con.createStatement();
					// updating value value 
					//stm.executeUpdate("update customer_data set quantity='"+quantity_table+"', total='"+total+"'  where table_no='"+table_number_1+"' and item_name='"+item_name+"'");
					stm.executeUpdate("delete from customer_data where table_no='"+table_number_1+"' and item_name='"+item_name+"'");
					//inserting value
					//stm.executeUpdate("insert into customer_data values('"+table_number_1+"','"+employ_id+"', null,0,1,'"+item_price+"','"+item_name+"')");
					//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

					
					}
					catch(Exception e)
					{ 
						System.out.println(e);
					}
			}
			}
			else 
			{
				
				
				
			}
			
			
			
		}
		
		
		
		response.sendRedirect("admin-cashier-bootstrap.jsp");
		
		
	}

}
