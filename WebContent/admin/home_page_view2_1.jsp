<%@page import="DBConnection.ConnectionProvider"%>
<%@page contentType="text/html" import="java.sql.*;" pageEncoding="UTF-8"%>
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
        String i_id1=request.getParameter("i_id");
        int i_id=Integer.parseInt(i_id1);
        String fun=request.getParameter("fun");
        out.print(fun);
        Connection con=null;
        try{
        	con=new ConnectionProvider().setConnection();
        if(fun.equalsIgnoreCase("add"))
                       {
        PreparedStatement ps= con.prepareStatement("update item set hpvi='1' where i_id='"+i_id+"'");
        ps.executeUpdate();
               }
        else if(fun.equalsIgnoreCase("remove"))
                       {
        PreparedStatement ps1= con.prepareStatement("update item set hpvi='0' where i_id='"+i_id+"'");
        ps1.executeUpdate();
               }
        response.sendRedirect("home_page_view2.jsp?name="+c_id+"");
        }catch(Exception e){}
        finally
        {
            try
            {
             con.close();
            }catch(Exception e){}
        }
        %>
    </body>
</html>
