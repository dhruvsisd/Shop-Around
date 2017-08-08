<%@page import="java.util.*"%>
<%@page session="true" %>
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
         String i_id=request.getParameter("i_id");
         ArrayList al1=(ArrayList) session.getAttribute("cart");
         
         /*
         for(int j=0;j<al1.size();j++)
         {
         out.println(al1.get(j));
         }  */
         
         
         int i=0;
         for(i=0;i<al1.size();i++)
         {
             if(al1.get(i).toString().equals(i_id))
              {
                break;                
              }                 
         }
         
         al1.remove(i);
         al1.remove(i);
        
         /*
         for(int j=0;j<al1.size();j++)
         {
         out.println(al1.get(j));
         } */  
        
         session.setAttribute("cart",al1);
         if(p_id.equals("1"))
            response.sendRedirect("buy.jsp");
         else if(p_id.equals("2"))
            response.sendRedirect("place_order3.jsp");
        %>
    </body>
</html>
