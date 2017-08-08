<%@page session="true" %>
<%@page contentType="text/html" import="java.sql.*,DBConnection.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
           String i_id1=session.getAttribute("i_id").toString();
           int i_id=Integer.parseInt(i_id1);
           String cus_id1=session.getAttribute("cus_id").toString();
           int cus_id=Integer.parseInt(cus_id1);
           
                          Connection con=null;
                          //Statement st1=null;
                          //ResultSet rs1=null;
                          Statement st2=null;
                          ResultSet rs2=null;
                          Statement st3=null;
                          ResultSet rs3=null;
                          Statement st4=null;
                          ResultSet rs4=null;
                          Statement st5=null;
                          ResultSet rs5=null;
                          int price=0;
                          
                    try{
                       con=new ConnectionProvider().setConnection();   
                          //st1=con.createStatement();
                          st2=con.createStatement();
                          st3=con.createStatement();
                          st4=con.createStatement();
                          st5=con.createStatement();
                          
                          
                          //rs1=st1.executeQuery("select cart_id from order_item order by cart_id ");
                          rs2=st2.executeQuery("select cart_id from cart_id");
                          rs2.next();
                          rs3=st3.executeQuery("select ci_id from cart_item_id ");
                          rs3.next();
                          rs4=st4.executeQuery("select SELLING_PRICE,DISCOUNT from item where i_id='"+i_id+"'");
                          rs4.next();
                          if(rs4.getInt(2)>0)
                            price=rs4.getInt(1)-(rs4.getInt(1)*rs4.getInt(2)/100);
                          else 
                            price=rs4.getInt(1);
                          
                          String last_cart_id=session.getAttribute("last_cart_id").toString();
                          
                          /*
                          int ch=0;
                          while(rs1.next())
                          {
                              if(last_cart_id.equals(rs1.getString(1)))
                                 {
                                  ch=1;
                                  break;
                                 }
                          } */
                          
                          
                          int ci_id=rs3.getInt(1)+1;
                          int cart_id=rs2.getInt(1);
                          if(last_cart_id=="0")
                           {
                              cart_id=cart_id+1;
                              PreparedStatement ps=con.prepareStatement("insert into cart1(cart_id,cus_id) values(?,?)");
                              ps.setInt(1, cart_id);
                              ps.setInt(2, cus_id);
                              ps.executeUpdate();
                              
                              PreparedStatement ps1=con.prepareStatement("insert into cart_item1 values(?,?,?,?,?)");
                              ps1.setInt(1, ci_id);
                              //ps1.setInt(2, cus_id);
                              ps1.setInt(2, cart_id);
                              ps1.setInt(3, i_id);
                              ps1.setInt(4, 1);
                              ps1.setInt(5, price);
                              ps1.executeUpdate();
                              
                              PreparedStatement ps2=con.prepareStatement("update cart_id set cart_id='"+cart_id+"'");
                              ps2.executeUpdate();
                              PreparedStatement ps3=con.prepareStatement("update cart_item_id set ci_id='"+ci_id+"'");
                              ps3.executeUpdate();
                           }
                          else if(last_cart_id!="0")
                           {
                              int chk=0;
                              int cart_id1=Integer.parseInt(last_cart_id);
                              rs5=st5.executeQuery("select i_id from cart_item1 where cart_id='"+cart_id1+"'");
                              while(rs5.next())
                                 {
                                  if(rs5.getString(1).equals(i_id1))
                                     {
                                      chk=1;
                                      break;
                                     }
                                 }
                              if(chk==0)
                              {
                              PreparedStatement ps4=con.prepareStatement("insert into cart_item1 values(?,?,?,?,?)");
                              ps4.setInt(1, ci_id);
                              //ps4.setInt(2, cus_id);
                              ps4.setInt(2, cart_id1);
                              ps4.setInt(3, i_id);
                              ps4.setInt(4, 1);
                              ps4.setInt(5, price);
                              ps4.executeUpdate();
                              
                              PreparedStatement ps5=con.prepareStatement("update cart_item_id set ci_id='"+ci_id+"'");
                              ps5.executeUpdate();
                              }
                           }
                          
                        response.sendRedirect("buy.jsp");  
                          
                    }catch(Exception e){out.print("outer try error");}finally{try{con.close();}catch(Exception e){}}
                    
        %>
    </body>
</html>
