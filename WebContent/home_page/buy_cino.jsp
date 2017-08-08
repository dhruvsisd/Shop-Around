<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        String i_id1="";
        if(request.getParameter("i_id")==null)
            i_id1="";
        else
            i_id1=request.getParameter("i_id");
        
        ArrayList al1=(ArrayList) session.getAttribute("cart");
          int ch=0;
          
        for(int j=0;j<al1.size();j++)
          {
              if(i_id1.equals(al1.get(j)))
                {
                  ch=1;
                  break;
                }
          }
          if(ch==0 && !i_id1.equals(""))
            {  
            al1.add(i_id1);
            al1.add("1");
            }
          session.setAttribute("cart",al1);  
         
          response.sendRedirect("buy.jsp");          
        %>
    </body>
</html>
