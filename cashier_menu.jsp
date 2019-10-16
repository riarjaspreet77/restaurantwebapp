<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.* " %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String table_number=request.getParameter("table_number");
System.out.println(table_number);
/* String[] all_category= new String[25];
 */
 ArrayList<String> all_category=new ArrayList<String>();
/*  all_category.get(0);
 all_category.size(); */
 int category_number=0;
int flag_category=0;
try {
	Class.forName("com.mysql.jdbc.Driver");

	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	
	
	// inserting value 
	//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
	String query = "SELECT * FROM menu ";
	  
		
	ResultSet rs = stm.executeQuery(query);
	%>
	
	<%
	
	while (rs.next())
		{  
			
			
		    String category_name = rs.getString("category");
		    
		    System.out.println(category_name+"  ");
		    if(category_number==0)
		    {
		    	all_category.add(category_name);
		    	System.out.println(all_category.get(category_number) +" 0 ");
		    	category_number=category_number+1;
		    	System.out.println(category_number+ " ");
		    	System.out.println(all_category.get(0));
	    		System.out.println(all_category.size());
		    	flag_category=1;
		    }
		    else
		    {
		    	System.out.println("enter else  break");
		    	
/* 		    	ListIterator itr= all_category.listIterator();
		    	while(itr.hasNext())
		    	{
		    		String ob=(String)itr.next();
		    		System.out.println(ob);
		    		if(ob.equals(category_name)  ){
		    			flag_category=1;
		    			System.out.println(all_category.get(category_number)+"  break");
		    			break;
		    			
		    		}
		    	} */
		    	System.out.println(category_number+"category number");
		    	for(int j=0;j<category_number;j++)
		    	{
		    		System.out.println("enter for  break");
		    		System.out.println(all_category.get(j));
		    		System.out.println(all_category.size());
		    		System.out.println(j);
		    		String temp=all_category.get(j);
		    		if(temp.equals(category_name)  ){
		    			flag_category=1;
		    			System.out.println(all_category.get(category_number)+"  break");
		    			break;
		    			
		    		}
		    		
		    	}
		    	System.out.println(all_category.get(category_number)+" no  break");
		    }
		    if(flag_category==0 && category_number>0)
		    {
		    	all_category.add(category_number,category_name);
		    	System.out.println(all_category.get(category_number)+" add ");
		    	category_number=category_number+1;
		    }
		    else
		    {
		    	flag_category=0;
		    }
		   
	
		    %>
<%-- 		    <form action="update_menu" method="post">
		    <input type="text" name="item_name" value=<%=item_name %>>
		     <input type="text" name="item_price" value=<%=Integer.toString(item_price) %>>
		      <input type="text" name="item_no" value=<%= Integer.toString(item_no)%>>
		      <input type ="submit" value="update" name="update">
		      <input type ="submit" value="remove" name="remove">
		      <br></br>
		    </form> --%>
  <%
  
  System.out.println(category_number+ " ");
		}
	
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
for (int i = 0; i < all_category.size(); i++) 
{
    System.out.println("Element at index " + i +  
                                 " : "+ all_category.get(i));           
}  
%>

</body>
</html>