<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
   function isInteger(s)
    {
      var i;
	s = s.toString();
      for (i = 0; i < s.length; i++)
      {
         var c = s.charAt(i);
         if (isNaN(c)) 
	   {
		alert("Given value is not a number");
		return false;
	   }
      }
      return true;
    }
</script>
</head>

<body onload="ld()">
    <%
    Connection con=null;
    Statement s[]=new Statement[20];
    ResultSet r[]=new ResultSet[20];
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection
           ("jdbc:oracle:thin:@localhost:1521:xe","eshopping","nolin");
      
        int c_id=Integer.parseInt(request.getParameter("c_id"));
        String category=request.getParameter("category");
        String category1=category.toLowerCase();
        String brand=request.getParameter("brand");
        String brand1=brand.toUpperCase();
        String s_value=request.getParameter("s_value");
        
        
        for(int i=0;i<20;i++)
           s[i]=con.createStatement();
        
        
        if(s_value==null)
        r[0]=s[0].executeQuery("select * from item where c_id='"+c_id+"' and brand_name='"+brand+"'"); 
        else if(s_value.equalsIgnoreCase("htl"))
        r[0]=s[0].executeQuery("select * from item where c_id='"+c_id+"' and brand_name='"+brand+"' order by DISCOUNT_PRICE desc"); 
        else if(s_value.equalsIgnoreCase("lth"))
        r[0]=s[0].executeQuery("select * from item where c_id='"+c_id+"' and brand_name='"+brand+"' order by DISCOUNT_PRICE asc"); 
        
    %>
             
    <script>
        function sort()
    {
        var s_value= document.frm.srch.value;
        if(s_value=="no")
            var unn=0;
        else
        window.location.replace("home_brand.jsp?c_id=<%=c_id%>&category=<%=category%>&brand=<%=brand%>&s_value="+s_value+"");
    }
    
    function refine()
    {
        var priceI= document.frm.start_price.value.trim();
        var priceII= document.frm.end_price.value.trim();
        var i;
	var s1 = priceI.toString();
        var s2 = priceII.toString();
        var ch1=0;
        var ch2=0;
        for (i = 0; i < s1.length; i++)
        {
         var c = s1.charAt(i);
         if (isNaN(c)) 
	   {
		ch1=1;
                break;
	   }
        }
        for (i = 0; i < s2.length; i++)
        {
         var c = s2.charAt(i);
         if (isNaN(c)) 
	   {
		ch2=1;
                break;
	   }
        }
        if(priceI=="" || priceII=="")
            var unn=0;
        else if(ch1==1)
            alert("Enter a valid number in price I");
        else if(ch2==1)
            alert("Enter a valid number in price II");
        else
        window.location.replace("home_brand_sort.jsp?c_id=<%=c_id%>&category=<%=category%>&brand=<%=brand%>&priceI="+priceI+"&priceII="+priceII+"");
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
                  <th style=" height: 45px"><p style="font-size: 16px"><%=brand1%> <%=category%></p></th>
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
      
      <!-- Categories -->
      <div class="box search">
        <h2>Refine <%=brand%> <%=category1%></h2>
        <div class="box-content">
          
            <br>
            <label>Price I</label>
            <input type="text" class="field" name="start_price" onKeyup="isInteger(this.value)"/>
            <br>
            <label>Price II</label>
            <input type="text" class="field" name="end_price" onKeyup="isInteger(this.value)"/>
            <input type="button" class="search-submit" value="Search" onclick="refine()"/>
            
          </form>
        </div>
      </div>
      <!-- End Categories -->
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

  
</body>
</html>
