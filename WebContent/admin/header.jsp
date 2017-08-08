<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <script type="text/javascript">
	function abc()
   {    myid=window.setTimeout("showtime()",1000); }

   function showtime()
   {
        d=new Date();
        x=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
        document.f1.t1.value=x;
        myid=window.setTimeout("showtime()",1000);
   }
      </script>
    </head>
    
    <body onload=abc()>
        <%
        String a_id1="";
        int a_id=0;
        try{
        a_id1=session.getAttribute("a_id").toString();
        a_id=Integer.parseInt(a_id1);
           }catch(Exception e)
               {
                   response.sendRedirect("../home_page/home.jsp");
               }
        Connection con1 = null;
        Statement stt;
        ResultSet rss;
        String email="";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con1 = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:xe", "eshopping", "nolin");
            stt=con1.createStatement();
            
            rss = stt.executeQuery("select email from admin where a_id='"+a_id+"'");
            rss.next();
            email=rss.getString(1);
            }catch (Exception e) {}
              finally
              {
                  try{
                     con1.close();
                  }catch(Exception e){}
              }   
        %>
      <div id="header">
    <h1 id="logo"><a href="#"></a></h1>
    <div id="cart" style=""> 
        <h2>Welcome Admin</h2>
     
      <form name=f1>
      <script type="text/javascript">
	var currentDate = new Date()
	var day = currentDate.getDate()
	var month = currentDate.getMonth() + 1
	var year = currentDate.getFullYear()
	document.write("<b>" + day + "/" + month + "/" + year + "</b>")
      </script>
      &nbsp;
          <INPUT size=10 name=t1 style=" color: white; background:url(../images/header.gif); border: 0">
      </form>
 
        
    </div>
  </div>
    </body>
</html>
