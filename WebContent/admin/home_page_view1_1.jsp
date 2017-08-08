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
        String fun=request.getParameter("fun");
        out.print(fun);
        Connection con=null;
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection
           ("jdbc:oracle:thin:@localhost:1521:xe","eshopping","nolin");
        if(fun.equalsIgnoreCase("add"))
                       {
        PreparedStatement ps= con.prepareStatement("update category set hpv='1' where c_id='"+c_id+"'");
        ps.executeUpdate();
               }
        else if(fun.equalsIgnoreCase("remove"))
                       {
        PreparedStatement ps1= con.prepareStatement("update category set hpv='0' where c_id='"+c_id+"'");
        ps1.executeUpdate();
               }
        response.sendRedirect("home_page_view1.jsp");
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
