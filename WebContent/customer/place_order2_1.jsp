<%@page import="java.sql.*,DBConnection.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        String cus_id1=session.getAttribute("cus_id").toString();
        int cus_id=Integer.parseInt(cus_id1);
        String last_cart_id=session.getAttribute("last_cart_id").toString();
        Connection con = null;
        Statement st;
        ResultSet rs=null;
        try {
           con=new ConnectionProvider().setConnection();
            st=con.createStatement();
            rs=st.executeQuery("select * from customer where cus_id='"+cus_id+"'");
            rs.next(); 

            PreparedStatement ps= con.prepareStatement("update cart1 set SHIPPING_EMAIL=?,SHIPPING_NAME=?,"
                    + "SHIPPING_ADDRESS=?,SHIPPING_CITY=?,SHIPPING_STATE=?,SHIPPING_PINCODE=?,"
                    + "SHIPPING_PHONE=? where cart_id='"+last_cart_id+"'");
            ps.setString(1, rs.getString(2));
            ps.setString(2, rs.getString(4));
            ps.setString(3, rs.getString(6));
            ps.setString(4, rs.getString(7));
            ps.setString(5, rs.getString(8));
            ps.setString(6, rs.getString(9));
            ps.setString(7, rs.getString(5));
            ps.executeUpdate();
             
             
            response.sendRedirect("place_order3.jsp");
            }catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              } 
        %>
    </body>
</html>
