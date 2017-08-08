<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/popup.css" type="text/css" media="all" />
    </head>
    <body>
        <div class="shell">
        <%@include file="header.jsp"%>
        <br><br><br>
        <%
        Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           Statement st1=null;
           ResultSet rs1=null;
           Statement st2=null;
           ResultSet rs2=null;
           
           try{
        	   con=new ConnectionProvider().setConnection();
               st=con.createStatement();
               st1=con.createStatement();
               st2=con.createStatement();
              
               
               rs=st.executeQuery("select * from cart1 where cus_id='"+cus_id+"' order by cart_id desc");
               
        %>
        <div style=" float: left; position: fixed; margin-top: 20px">
        <div class="boxac categoriesac">
        <h2><b>My Account</b></h2>
        <div class="box-contentac">
            <ul>
                <br>
                <li><a href="my_orders.jsp"><b>My Order</b></a></li>
                <br><br>
                <li><a href="account.jsp"><b>Personal Information</b></a></li>
                <br><br>
                <li><a href="change_pass.jsp"><b>Change Password</b></a></li>
                <br><br>
                <li><a href="address.jsp"><b>Address</b></a></li>
                <br><br>
                <li><a href="update_email.jsp"><b>Update Email</b></a></li>
            </ul>
        </div>   
        </div>
        </div>
        <div style=" margin-left: 250px">
            <table width="400"  border="0">
                    <tr>
                        <td height="45" style=""><u><p style=" font-size: 18px"><b>My Orders</b></p></u></td>
                    </tr>
            </table>
            <table width="660"  border="0">
                    <tr>
                        <th width="40" height="30" scope="col" style="border:solid 1px #dedede; color: #cc3300">Order No.</th>
                        <th width="70" scope="col" style="border:solid 1px #dedede; color: #cc3300">Items (quantity)</th>
                        <th width="50" scope="col" style="border:solid 1px #dedede; color: #cc3300">Total Amt</th>
                        <th width="60" scope="col" style="border:solid 1px #dedede; color: #cc3300">Status</th>
                        <th width="40" scope="col" style="border:solid 1px #dedede; color: #cc3300">Details</th>
                    </tr>
               <%
               while(rs.next())
               {   
                   int presnt=0;
                   String order_id="0";
                   rs1=st1.executeQuery("select * from order_item");
                   int tracking_id=0;
                while(rs1.next())
                 {     
                  if(rs.getString(1).equals(rs1.getString(2)))
                  {
                     presnt=1; 
                     order_id=rs1.getString(1);
                     tracking_id=rs1.getInt(5);
                  }
                 }
                   if(presnt==1)
                   {
                    int rc=0;
                    rs2=st2.executeQuery("select i_name,quantity from item,cart_item1 where item.i_id=cart_item1.i_id and cart_item1.cart_id='"+rs.getString(1) +"'");     
                   while(rs2.next()){
                       if(rc==0){
               %>     
                    <tr>
                        <th height="30" scope="col">ORD0<%=order_id%></th>
                        <th scope="col" ><%=rs2.getString(1)%> (<%=rs2.getString(2)%>)</th>
                        <th scope="col" ><%=rs.getString(10)%></th>
                        <th scope="col" >Shipped : Bluedart Couriers. Tracking ID: TRID21<%=tracking_id%></th>
                        <th scope="col" ><a href="place_order.jsp?o_id=<%=order_id%>">details</a></th>
                    </tr>
                <% } 
                   else if(rc>0)
                   {
                    %>     
                    <tr>
                        <th height="30" scope="col"></th>
                        <th scope="col" ><%=rs2.getString(1)%> (<%=rs2.getString(2)%>)</th>
                        <th scope="col" ></th>
                        <th scope="col" ></th>
                        <th scope="col" ></th>
                    </tr>
                <% }
                       rc++; } } } 
                 }catch (Exception e) {}
              finally
              {
                  try{
                     con.close();
                  }catch(Exception e){}
              }   
                 %>
                </table>
        </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    <%@include file="footer.jsp"%>
    </div>
    </body>
</html>
