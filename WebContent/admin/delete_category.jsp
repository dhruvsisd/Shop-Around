<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    
                    
                    String c_id1=request.getParameter("c_id");
                    int c_id=Integer.parseInt(c_id1);
                    Connection con=null;  
                    Statement st =null;
                    ResultSet rs=null;
                    try{
                    	con=new ConnectionProvider().setConnection();
                          st=con.createStatement();
                          rs=st.executeQuery("select c_name from category where c_id='"+c_id+"'");
                          rs.next();
                          
                          
                          try{
                          PreparedStatement ps1= con.prepareStatement("delete from item where c_id='"+c_id+"'");
                          ps1.executeUpdate();
                          PreparedStatement ps2= con.prepareStatement("delete from item_image where c_id='"+c_id+"'");
                          ps2.executeUpdate();}catch(Exception e){}
                          PreparedStatement ps3= con.prepareStatement("delete from category where c_id='"+c_id+"'");
                          ps3.executeUpdate();
                          
                          PreparedStatement ps= con.prepareStatement("drop table "+rs.getString(1)+"");
                          ps.executeUpdate();
                 
                         response.sendRedirect("view_all_category.jsp");
                    }catch(Exception e){
                        session.setAttribute("cant_del", "cant_del");
                         response.sendRedirect("view_all_category.jsp");
                    }finally{try{con.close();}catch(Exception e){}}
                        %>
    </body>
</html>
