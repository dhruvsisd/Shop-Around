<%@page import="DBConnection.ConnectionProvider"%>
<%@page session="true" %>
<%@page contentType="text/html" import="java.sql.*;" pageEncoding="UTF-8"%>
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
                    int ci_id=Integer.parseInt(ci_id1);
                    
                    Connection con=null;
                    try{
                    	con=new ConnectionProvider().setConnection();
                          PreparedStatement ps= con.prepareStatement("delete from cart_item1 where ci_id='"+ci_id+"'");
                          ps.executeUpdate();
                          
                          if(p_id.equals("1"))
                           response.sendRedirect("buy.jsp");
                          else if(p_id.equals("2"))
                           response.sendRedirect("place_order3.jsp");
                    }catch(Exception e){out.print("outer try error");}finally{try{con.close();}catch(Exception e){}}
                        %>
    </body>
</html>
