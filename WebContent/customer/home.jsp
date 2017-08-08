<%@page contentType="text/html" pageEncoding="UTF-8" import="DBConnection.*"%>
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

<body>
    <!-- Shell -->
<div class="shell">
    
  <!-- Header -->
  <%@include file="header.jsp"%>
  <!-- End Header -->
  
    <%
    Connection con=null;
    Statement s[]=new Statement[20];
    ResultSet r[]=new ResultSet[20];
    try{
        con=new ConnectionProvider().setConnection();
        for(int i=0;i<20;i++)
           s[i]=con.createStatement();
        
        r[0]=s[0].executeQuery("select * from category where hpv='3' order by c_id"); 
        
        
    %>
             
 
  <!-- Main -->
  <div id="main">
    
    <!-- Content -->
    <div id="content">
        
      <!-- Content Slider -->
        <%@include file="slider.jsp"%>
      <!-- End Content Slider -->
      
      <!-- Products -->
      <div class="products">
          
<%
       while(r[0].next())
         {         
           %>
          <div class="box1">
              <a href="#"><h2 style="color: black"><%=r[0].getString(2).toUpperCase()%></h2></a>
          </div>
          <%
          try{
              r[1]=s[1].executeQuery("select * from item where c_id='"+r[0].getString(1)+"' and hpvi='3'");
              while(r[1].next())
               {
%>           

        <ul>
            <li> <a href="item_click.jsp?i_id=<%=r[1].getString(1)%>"><img src="image.jsp?i_id=<%=r[1].getString(1)%>"/></a>
            <div class="product-info">
              <div class="product-desc">
                  <h3><a href="item_click.jsp?i_id=<%=r[1].getString(1)%>"><%=r[1].getString(3)%></a></h3> 
                  <% if(r[1].getInt(14)==0) { %>
                  <h3> </h3>
                  <h3>Rs. <%=r[1].getString(10)%></h3>
                  <% }else {
                      int new_price=r[1].getInt(10)-(r[1].getInt(10)*r[1].getInt(14)/100);
                  %>
                  <div style="text-decoration: blink; color: red; padding-left: 10px">discount <%=r[1].getInt(14)%> %</div>
                  <h3>Rs. <strike><%=r[1].getString(10)%></strike> <%=new_price%></h3>
                  <% }%>
              </div>
          </li>
        </ul>
        
<%  
      }}catch(Exception e){}%>
            <div class="cl">&nbsp;</div>
            <br>
          <%
          }

%>
        
        <div class="cl">&nbsp;</div>
      </div>
    <!-- End Products -->
    </div>
    <!-- End Content -->
    
    <!-- Sidebar -->
    <div id="sidebar">
        
      <!-- Search -->
      <div class="box search">
        <h2>Search by</h2>
        <div class="box-content">
            <form name="frm">
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
            </form>
        </div>
      </div>
      <!-- End Search -->
      
      <!-- Categories -->
      <div class="box categories">
        <h2>Categories</h2>
        <div class="box-content">
          <ul>
            <% 
                r[3]=s[3].executeQuery("select * from category");                    
                while(r[3].next())
                 {
            %>    
            <br><li><a href="home_category.jsp?c_id=<%=r[3].getString(1)%>&category=<%=r[3].getString(2)%>"><b><%=r[3].getString(2)%></b></a></li>
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
  
  <!-- End Side Full -->
  
  <!-- Footer -->
    <%@include file="footer.jsp"%>
  <!-- End Footer -->
  
</div>
<!-- End Shell -->

</body>
</html>
