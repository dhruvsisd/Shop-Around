<%@page contentType="text/html" import="java.sql.*,DBConnection.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
<script>
    function search()
    {
        var i_name= document.frm.item_name.value.trim();
        var c_id= document.frm.category.value;
        if(i_name=="")
            var unn=0;
        else
        window.location.replace("home_search.jsp?item_name="+i_name+"&c_id="+c_id+"");
    }
    
</script>
</head>

<body onload="ld()">
    <%
    Connection con=null;
    Statement s[]=new Statement[20];
    ResultSet r[]=new ResultSet[20];
    try{
       con=new ConnectionProvider().setConnection();
        int c_id=Integer.parseInt(request.getParameter("c_id"));
        String category=request.getParameter("category").toUpperCase();
        String s_value=request.getParameter("s_value");
        for(int i=0;i<20;i++)
           s[i]=con.createStatement();
        
        if(s_value==null)
        r[0]=s[0].executeQuery("select * from item where c_id='"+c_id+"'"); 
        else if(s_value.equalsIgnoreCase("htl"))
        r[0]=s[0].executeQuery("select * from item where c_id='"+c_id+"' order by DISCOUNT_PRICE desc"); 
        else if(s_value.equalsIgnoreCase("lth"))
        r[0]=s[0].executeQuery("select * from item where c_id='"+c_id+"' order by DISCOUNT_PRICE asc"); 
    %>
    <script>
        function sort()
    {
        var s_value= document.frm.srch.value;
        if(s_value=="no")
            var unn=0;
        else
        window.location.replace("home_category.jsp?c_id=<%=c_id%>&category=<%=category%>&s_value="+s_value+"");
    }
    
    function ld()
    {
    document.frm.srch.value="<%=s_value%>";
    }
        </script>
             
<!-- Shell -->
<div class="shell">
    
  <!-- Header -->
  <%@include file="header.jsp"%>
  <!-- End Header -->
 
  <!-- Main -->
  <div id="main">
    
    
    <div id="content">
      
      <div class="products">
          <table border="0" style=" width: 724px; border:solid 1px #dedede;">
              <tr>
                  <th style=" height: 45px"><p style="font-size: 16px"><%=category%></p></th>
              </tr>
          </table>
              <form name="frm">
          <table border="0">
              <tr>
                  <td style="width: 560px"></td>
                  <td style=" height: 45px">
                      <div style=" width: 150px; height: 27px; border: solid 1px #999999;">
                      
                          <select name="srch" STYLE="width: 140px; padding-top: 3px; padding-left: 10px; border: 0" onchange="sort()">
                              <option value="no">Sort By</option>  
                              <option value="htl">Price--High to Low</option>
                              <option value="lth">Price--Low to High</option>
                            </select>
                      </div>
                  </td>
              </tr>
          </table>
          <br><br>
          <%
          try{
              while(r[0].next())
               {
%>           

        <ul>
            <li> <a href="item_click.jsp?i_id=<%=r[0].getString(1)%>"><img src="image.jsp?i_id=<%=r[0].getString(1)%>"/></a>
            <div class="product-info">
              <div class="product-desc">
                  <a href="item_click.jsp?i_id=<%=r[0].getString(1)%>"><h3><%=r[0].getString(3)%></h3></a>
                  <% if(r[0].getInt(14)==0) { %>
                  <h3> </h3>
                  <h3>Rs. <%=r[0].getString(10)%></h3>
                  <% }else {
                      int new_price=r[0].getInt(10)-(r[0].getInt(10)*r[0].getInt(14)/100);
                  %>
                  <div style="text-decoration: blink; color: red; padding-left: 10px">discount <%=r[0].getInt(14)%> %</div>
                  <h3>Rs. <strike><%=r[0].getString(10)%></strike> <%=new_price%></h3>
                  <% }%>
              </div>
          </li>
        </ul>
        
<%  
       }}catch(Exception e){}%>
          
          
        <div class="cl">&nbsp;</div>
      </div>
    </div>
    
    
    <!-- Sidebar -->
    <div id="sidebar">
        
     <!-- Search -->
      <div class="box search">
        <h2>Search by</h2>
        <div class="box-content">
            
            <br>
            <label>Item</label>
            <input type="text" class="field" name="item_name"/>
            <br>
            <label>Category</label>
            <select class="field" name="category">
              <option value="">-- Select Category --</option>
              <% 
       r[2]=s[2].executeQuery("select * from category");                    
       while(r[2].next())
         {
            %>    
                    <option value="<%=r[2].getString(1)%>"><%=r[2].getString(2)%></option>
            <%  
         }    
            %>
            </select>
            <input type="button" class="search-submit" value="Search" onclick="search()"/>
            
        </div>
      </div>
            
      </form>
      <!-- Categories -->
      <div class="box categories">
        <h2>Brands</h2>
        <div class="box-content">
          <ul>
            <% 
                r[3]=s[3].executeQuery("select distinct brand_name from item where c_id='"+c_id+"'");                    
                while(r[3].next())
                 {
            %>    
            <br><li><a href="home_brand.jsp?c_id=<%=c_id%>&category=<%=category%>&brand=<%=r[3].getString(1)%>"><b><%=r[3].getString(1)%></b></a></li>
            <%  
                 }    
            %>
          </ul>        
            <%           
       }catch(Exception se){}
        finally
        {
            try
            {
             con.close();
            }catch(Exception e){}
        }

            %>
          
        </div>
      </div>
      <!-- End Categories -->
    </div>
    <!-- End Sidebar -->
      
   <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  
  <!-- Side Full -->
  <div class="side-full">
      
    
    
  </div>
  <!-- End Side Full -->
  
  <!-- Footer -->
    <%@include file="footer.jsp"%>
  <!-- End Footer -->
  
</div>
<!-- End Shell -->

  <!-- sign up -->
    <%@include file="signup.jsp"%>
  <!--end sign up -->
  
  <!-- sign in -->
    <%@include file="signin.jsp"%>
  <!--end sign in -->
  <%
if(session.getAttribute("loginfail")=="loginfail")
        {
                   %><script language="javascript">alert("Incorrect Email Id or Password\nLog In Fail\nTry Again");</script><%
                   session.removeAttribute("loginfail");
        }
else if(session.getAttribute("logupfail")=="logupfail")
        {
                   %><script language="javascript">alert("Cant Register\n Email Id already exists");</script><%
                   session.removeAttribute("logupfail");
        }
else if(session.getAttribute("logupsuccess")=="logupsuccess")
        {
                   %><script language="javascript">alert("Successfully Registered");</script><%
                   session.removeAttribute("logupsuccess");
        }
%>
</body>
</html>
