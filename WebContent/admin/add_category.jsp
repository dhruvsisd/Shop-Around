<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page session="true" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            var cnt=0;
    function generateRow(){
        var d=document.getElementById("div");
        var st=document.form1.box1.value;
        
        if(st.length==0)
            alert("empty field cant be added");
        else
            {
        var len=st.length;
        var i=0;
        var st1="";
        var ch1=0;
        for(i=0;i<len;i++)
            {
             if(st.charAt(i)==" ")
                 {
                     //var ch=st.charAt(i);
                     if(ch1==0)
                         {
                          st1=st1+"";
                          ch1=0;
                         }
                     else
                         {
                          st1=st1+"_";
                         }
                 }
             else
               {
                    st1=st1+st.charAt(i);
                    ch1=1;
               }
            }
        
        d.innerHTML+="<input type='text' name="+st1+" value="+st1+" style=' height: 27px; border:solid 1px #999999' size='35'><br><br>";
        cnt++;
        document.form1.box1.value=null;
            }
    }

    function load()
    {
        document.form1.box1.value=null;
        document.form1.category.value=null;
    }

    function load1()
    {
        var b="";
        if(document.form1.category.value=="")
            {
                b="category cant be empty";
            }
        
        if(b.length!=0)
            {
                alert(b);
            }
        else if(cnt==0)
            alert("no columns added");
        else
            {
             document.form1.submit();   
            }
    }
</script>
    </head>
    <body onload="load()">
        <div class="shell">
            <div style="min-height: 600px">
        <%@include file="header.jsp"%>
        <%@include file="drop_down_menu.jsp"%>
        
        
        <br><br><br><br><br>
        <div align="center"><p style="color: red; font-size: 15px"><u><b>ADD CATEGORY</b></u></p></div>
        <br>
        
           
            <form name="form1" id="form1" ENCTYPE="multipart/form-data" name="frm1"  ACTION="../category_add" METHOD="post">
                <div style="padding-left: 140px; padding-top: 60px; float: left" >
                    <table border="0">
                        <tr>
                            <td style=" color: #000000; font-size: 13px">Category</td>
                            <td><input type="text" name="category" style=" height: 27px; border:solid 1px #999999" size="35"></td>
                        </tr>
                    <tr>
                        <td></td>
                        <td style="height: 70px"><input name="btn1" type="button" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" value="Submit" onclick="load1();"/><td> 
                    </tr>
                    
                    </table>    
                </div>
                <div style="padding-left: 500px; padding-top: 60px;" >
                <table border="0" style=" width: 40px">
                    <tr>
                        <td></td>
                        <td><div id="div"></div><td>
                        <td></td>
                </tr>    
                <tr>
                        <td style=" color: #000000; font-size: 13px">Description</td>
                        <td><input type="text" name="box1" style=" height: 27px; border:solid 1px #999999" size="35"></td>
                        <td><input name="btn" type="button" value="Add" style="width: 70px; height: 30px; border:solid 1px #999999; background-color: #990000; color: white; font-size: 14px" onclick="generateRow()"/></td>
                </tr>
                </table>
                </div>
            </form>  
            
            
        
            
            
       
        </div>
        <%@include file="footer.jsp"%>
        </div>
        
        
<%
if(session.getAttribute("msg")=="already")
        {
                   %><script language="javascript">alert("Table already exist\nor\nInvalid table name");</script><%
                   session.removeAttribute("msg");
        }
else if(session.getAttribute("msg")=="success")     
        {
                   %><script language="javascript">alert("successful");</script><%
                   session.removeAttribute("msg");
        }
else if(session.getAttribute("msg")=="notcreated")     
        {
                   %><script language="javascript">alert("table cant be created\nsame field name/reserved word/empty field cant be used");</script><%
                   session.removeAttribute("msg");
        }
%>
        
        
        </body>
</html>
