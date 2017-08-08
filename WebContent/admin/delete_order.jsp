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
        String o_id=request.getParameter("o_id");
        Connection con=null;
        Statement st=null;
        Statement st1=null;
        ResultSet rs=null;
        ResultSet rs1=null;
                    try{
                    	con=new ConnectionProvider().setConnection();     st= con.createStatement();
                        st1= con.createStatement();
                        
                        rs= st.executeQuery("select cart_id from order_item where o_id='"+o_id+"'");  
                        rs.next();
                        int cart_id=rs.getInt(1);
                        
                        PreparedStatement ps= con.prepareStatement("delete from order_item where o_id='"+o_id+"'");
                        ps.executeUpdate();
                        
                        PreparedStatement ps1= con.prepareStatement("delete from cart_item1 where cart_id='"+cart_id+"'");
                        ps1.executeUpdate();
                                                 
                        PreparedStatement ps2= con.prepareStatement("delete from cart1 where cart_id='"+cart_id+"'");
                        ps2.executeUpdate(); 
                        
                        session.setAttribute("del", "suc_del");  
                        response.sendRedirect("dispatched_order.jsp");
                    }catch(Exception e)
                    {
                        session.setAttribute("del", "cant_del");
                        response.sendRedirect("dispatched_order.jsp");                     
                    }finally{try{con.close();}catch(Exception e){}}
        %>
    </body>
</html>
