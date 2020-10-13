
<%-- 
    Document   : login
    Created on : 23 May, 2020, 10:43:02 AM
    Author     : IDBI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "myStyle.css" /> 
        <script src="https://code.jquery.com/jquery-1.10.2.js"
	type="text/javascript"></script>
        <!--<link rel = "stylesheet" type = "text/css" href = "main.css" />-->
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
                <div class="container-fluid">
   
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col-sm">
                 <%
                     String url="verify";
                     String next=(String) request.getParameter("next");
                     if(next!=null)
                     {
                         url = url+"?next="+next;
                     }
                    
                    %>
   <%
      if(request.getParameter("msg")!=null)
      {
      
    %>      <div style="color:rgb(240, 20, 40)">
             <%= request.getParameter("msg") %>
            </div>
  <%   
      }
  %>
        <form action=<%=url%> method="POST">
              
            <div class="form-group">
                
                 <div class="row">
        <div class="span6" style="float: none; margin: 0 auto;">
                    <h2>LOGIN</h2>
                </div>
                 </div>
             
                <label>User Type</label>
                <select name="utype" id="usertype" onchange="usertypefunc()"class="form-control" id="exampleFormControlSelect1">
                <option selected="" disabled="">---</option>
                <option value="Guest">Guest</option>
                <option value="Registered">Registered</option>
                <option value="Admin">Admin</option>
            </select><br id="br1">
            <label id="emaillabel">E-mail ID/PhoneNo</label>
            <!--onblur="validateemail()"-->
            <input type="text" name="email" id="email"  class="form-control" >
            <small id="emaildiv" class="validations" style="color:rgb(240, 20, 40)"></small><br id="br2">
            <label id="pwordlabel">Password</label>
            <input type="password" name="pword" id="pword" class="form-control" ><br>
            
            <button align="center" type="submit" name="Login" class="btn btn-primary">Login</button>
            </div> 
        </form>
                    </div>
                    <div class="col-sm">
                        
                    </div>
        </div>    
                </div>
    </main>
        
        <jsp:include page="footer.jsp"/>
        <script>
            
            $(document).ready(function() {
        $('#email').blur(function(event) {
                var name = $('#email').val();
                $.get('LoginAJAX', {
                        userName : name
                }, function(responseText) {
                        $('#emaildiv').text(responseText);
                });
        });
       });
            
//            function validateemail() 
//            {
//                var x = document.getElementById("email").value;
//                var atpos = x.indexOf("@");
//                var dotpos = x.lastIndexOf(".");
//                if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
//
//
//                    document.getElementById("emaildiv").innerHTML = "Invalid email Address!";
//                }
//                else {
//                    document.getElementById("emaildiv").innerHTML = "";
//                }
//            }
      
            function usertypefunc()
            {
                var x = document.getElementById("usertype").value;
                var y = document.getElementById("pword");
                var z = document.getElementById("email");
                var a = document.getElementById("pwordlabel");
                var b = document.getElementById("emaillabel");
                var c = document.getElementById("emaildiv");

                var s="Guest";
                if(x===s)
                {
                    z.style.visibility = "hidden" ;
                    y.style.visibility = "hidden" ;
                    a.style.visibility = "hidden" ;
                    b.style.visibility = "hidden" ;
                    c.style.visibility = "hidden" ;


                }
                else
                {
                    z.style.visibility = "visible" ;
                    y.style.visibility = "visible" ;
                    a.style.visibility = "visible" ;
                    b.style.visibility = "visible" ;
                    c.style.visibility = "visible" ;

                }
            }
      </script>
    </body>
</html>
