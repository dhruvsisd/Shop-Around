<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
                    
                    String email_id=request.getParameter("email");
                    String id=request.getParameter("id");
                    String email=request.getParameter("email_id");
                    
                          Connection con=null;
                          Statement st=null;
                          ResultSet rs=null;
                          Statement st1=null;
                          ResultSet rs1=null;
                          ResultSetMetaData metaData=null;
                    try{
                    	con=new ConnectionProvider().setConnection();
                          st=con.createStatement();
                          st1=con.createStatement();
                          
                          rs=st.executeQuery("select cus_id from customer where EMAIL_ID='"+email_id+"'");
                          rs.next();
                          int cus_id=rs.getInt(1);
                         
                          rs1=st1.executeQuery("select cart_id from cart1 where cus_id='"+cus_id+"'");
                          while(rs1.next())
                          {
                            PreparedStatement ps1= con.prepareStatement("delete from cart_item1 where cart_id='"+rs1.getInt(1)+"'");
                            ps1.executeUpdate();  
                            PreparedStatement ps2= con.prepareStatement("delete from order_item where cart_id='"+rs1.getInt(1)+"'");
                            ps2.executeUpdate();  
                          }
                          
                          PreparedStatement ps3= con.prepareStatement("delete from cart1 where cus_id='"+cus_id+"'");
                          ps3.executeUpdate();
                          
                          PreparedStatement ps4= con.prepareStatement("delete from feedback where cus_id='"+cus_id+"'");
                          ps4.executeUpdate();
                          
                          PreparedStatement ps= con.prepareStatement("delete from customer where cus_id='"+cus_id+"'");
                          ps.executeUpdate();
                         
                         if(id.equals("1"))
                         response.sendRedirect("user_registered.jsp");
                         else if(id.equals("2"))
                         response.sendRedirect("search_user_registered.jsp?email="+email+""); 
                    }catch(Exception e)
                    {
                        session.setAttribute("cant_del", "cant_del");
                        if(id.equals("1"))
                         response.sendRedirect("user_registered.jsp");
                        else if(id.equals("2"))
                         response.sendRedirect("search_user_registered.jsp?email="+email+"");    
                    }finally{try{con.close();}catch(Exception e){}}
                        %>
    </body>
</html>
