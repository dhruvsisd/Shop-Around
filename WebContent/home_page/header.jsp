<%@page session="true"%>
<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />       

    </head>
    
    <body>
        <%
          
          ArrayList al = new ArrayList();
          
          if(session.getAttribute("cart")==null)
           {
           session.setAttribute("cart",al);
           }
          ArrayList cino=(ArrayList) session.getAttribute("cart");
          int sz=0;
          sz=cino.size();     
          sz=sz/2;   
        %>
      <div id="header" >
    <h1 id="logo" ><a href="home.jsp"></a></h1>
    <!-- Cart -->
    <div id="cart"> 
      <a href="buy.jsp" class="cart-link">Cart Items:</a> <span><strong><%=sz%></strong></span> 
      
    </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="#overlay">Sign In</a></li>
        <li><a href="#overlay_signup">Sign Up</a></li>
        <li><a href="about_us.jsp">About Us</a></li>
        <li><a href="contact_us.jsp">Contact</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
    </body>
</html>
