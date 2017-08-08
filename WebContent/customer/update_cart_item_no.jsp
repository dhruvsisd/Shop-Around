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
         String p_id=request.getParameter("p_id");
         String ci_id1=request.getParameter("ci_id");
         String quantity1=request.getParameter("quantity");
         int ci_id=Integer.parseInt(ci_id1);
         int quantity=Integer.parseInt(quantity1);
         Connection con;
         Statement st=null;
         ResultSet rs=null;
         Statement st1=null;
         ResultSet rs1=null;
         try{
        	 con=new ConnectionProvider().setConnection();
             st=con.createStatement();
             st1=con.createStatement();
             
             rs=st.executeQuery("select i_id from cart_item1 where ci_id='"+ci_id+"'");
             rs.next();
             int i_id=rs.getInt(1);
            
             rs1=st1.executeQuery("select SELLING_PRICE,discount from item where i_id='"+i_id+"'");
             rs1.next();
             
             int price=0;
             if(rs1.getInt(2)>0)
             {
              price=rs1.getInt(1)-(rs1.getInt(1)*rs1.getInt(2)/100);
              price=quantity*price;
             }
             else
             {
             price=rs1.getInt(1);
             price=quantity*price;
             }
             
             PreparedStatement ps=con.prepareStatement("update cart_item1 set quantity=?,price=? where ci_id='"+ci_id+"'");
             ps.setInt(1, quantity);
             ps.setInt(2, price);
             ps.executeUpdate();
             if(p_id.equals("1"))
              response.sendRedirect("buy.jsp");
             else if(p_id.equals("2"))
              response.sendRedirect("place_order3.jsp");
            }catch(Exception e){}
        %>
    </body>
</html>
