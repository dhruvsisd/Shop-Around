<%@page import="DBConnection.ConnectionProvider"%>
<%@page session="true" %>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        
    </head>
    
    <body>
  <%    String cus_id1="";
        int cus_id=0;
        try{
        cus_id1=session.getAttribute("cus_id").toString();
        cus_id=Integer.parseInt(cus_id1);
               }catch(Exception e)
               {
                   response.sendRedirect("../home_page/home.jsp");
               }
        Connection con1 = null;
        Statement stt;
        ResultSet rss;
        Statement stt1;
        ResultSet rss1;
        Statement stt2;
        ResultSet rss2;
        Statement stt3=null;
        ResultSet rss3;
        String email="";
        int cino=0;
        try {
        	con1=new ConnectionProvider().setConnection();
            stt=con1.createStatement();
            stt1=con1.createStatement();
            stt2=con1.createStatement();
            stt3=con1.createStatement();
            
            rss = stt.executeQuery("select email_id from customer where cus_id='"+cus_id+"'");
            rss.next();
            email=rss.getString(1);
           
            rss1=stt1.executeQuery("select cart_id from cart1 where cus_id='"+cus_id+"' order by cart_id ");
            String last_cart_id="0";
            while(rss1.next())
              last_cart_id=rss1.getString(1);
            int m=0;
            rss2 = stt2.executeQuery("select cart_id from order_item order by cart_id");
            while(rss2.next())
               {
                 if(rss2.getString(1).equals(last_cart_id))
                     m=1;
               }
            if(m==1)
                last_cart_id="0";
              session.setAttribute("last_cart_id", last_cart_id); 

            if(!last_cart_id.equals("0"))
             {
               rss3 = stt3.executeQuery("select * from cart_item1 where cart_id='"+last_cart_id+"'");
               while(rss3.next())
                   cino++;
             }
                                                  
             }catch (Exception e) {}
              finally
              {
                  try{
                     con1.close();
                  }catch(Exception e){}
              }   
        int lei=email.length();
        String sss="";
        for(int i=0;i<lei;i++)
            {
             if(email.charAt(i)!='@' && i<13)
                 {
                     sss=sss+email.charAt(i);
                 }
             else 
                 break;
            }       
         
        
  %>
      <div id="header">
    <h1 id="logo"><a href="#"></a></h1>
    <!-- Cart -->
    <div id="cart"> 
        <div style="padding-top: 0px; padding-left: 5px;">
           <%=sss%>...
        </div>
        <div style="padding-top: 5px">
      <a href="buy.jsp" class="cart-link">Cart Items:</a> <span><strong><%=cino%></strong></span> 
      </div>
    </div>
    
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="account.jsp">Account</a></li>
        <li><a href="my_orders.jsp">Orders</a></li>
        <li><a href="about_us.jsp">About Us</a></li>
        <li><a href="contact_us.jsp">Contact</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <li><a href="logout.jsp">Sign Out</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
    </body>
</html>
