<%@page session="true" %>
<%@page contentType="text/html" import="java.sql.*,DBConnection.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    String i_id1=request.getParameter("i_id");
                    String c_id1=request.getParameter("c_id");
                    String p_id=request.getParameter("p_id");
                    int i_id=Integer.parseInt(i_id1);
                    int c_id=Integer.parseInt(c_id1);
                          Connection con=null;
                    try{
                       con=new ConnectionProvider().setConnection();
                        Statement st= con.createStatement();
                        Statement st1= con.createStatement();
                        ResultSet rs=null;
                        ResultSet rs1=null;
                       
                          PreparedStatement ps= con.prepareStatement("delete from item where i_id='"+i_id+"'");
                          ps.executeUpdate();
                          PreparedStatement ps1= con.prepareStatement("delete from item_image where i_id='"+i_id+"'");
                          ps1.executeUpdate();
                          
                          rs= st.executeQuery("select * from category where c_id='"+c_id+"'");  
                          rs.next();
                          try{                          
                          PreparedStatement ps2= con.prepareStatement("delete from "+rs.getString(2)+" where i_id='"+i_id+"'");
                          ps2.executeUpdate(); }catch(Exception e){}
                       if(p_id.equals("3"))
                         response.sendRedirect("admin.jsp");   
                       else if(p_id.equals("2"))
                        response.sendRedirect("view_all.jsp");
                       else if(p_id.equals("1"))
                        {
                        session.setAttribute("suc_del", "suc_del");
                        response.sendRedirect("search.jsp");
                        }
                    }catch(Exception e){
                        session.setAttribute("cant_del", "cant_del");
                       if(p_id.equals("3"))
                        {
                         response.sendRedirect("admin.jsp");
                        }
                       else if(p_id.equals("2"))
                        {
                         response.sendRedirect("view_all.jsp");
                        }
                       else if(p_id.equals("1"))
                        {
                         response.sendRedirect("search.jsp");
                        }
                    }finally{try{con.close();}catch(Exception e){}}
                        %>
    </body>
</html>
