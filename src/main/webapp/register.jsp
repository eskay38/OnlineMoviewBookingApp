<%-- 
    Document   : register
    Created on : 23 May, 2020, 10:47:53 AM
    Author     : IDBI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
               
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <%-- <script src="script.js"></script> --%>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
         <link rel = "stylesheet" type = "text/css" href = "myStyle.css" />
         <style>
             .validations
            {
                font-family : "Lobster";
                font-size: 15px;
                color: rgb(255, 99, 71);
            }
         </style>
        <title>Register</title
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
        <div class="container-fluid" >
 
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col-sm">
        <form action="add" method="POST"  onsubmit="return validateAll();">
              
            <div class="form-group">
                <div class="row" class="formhead">
                 
        <div class="span6" style="float: none; margin: 0 auto;">
                    <h2>REGISTER</h2>
                    
  
        </div> 
             </div> 
            <label>UserName</label> 
            <input type="text" id="name" name="name" onblur="validatename()" class="form-control" >
            <small id="namediv" class="validations" ></small><br><br>
            <label>E-mail ID</label> 
            <input type="text" name="email" id="email" onblur="validateemail()" class="form-control" >
            <small id="emaildiv" class="validations" >
             <%
      if(request.getParameter("msg")!=null)
      {
      
  %><div style="color:rgb(255, 99, 71)">
      Error message :  <%= request.getParameter("msg") %>!
  </div>
  <%    }
  %>
            </small><br><br>
            <label>Phone No.</label> 
            <input type="text" name="phno" id="phno" onblur="validatephno()" class="form-control" >
            <small id="phnodiv" class="validations" ></small><br><br>
            <label>Password</label>
            <input type="password" id="pword" name="pword" onblur="validatepword()" class="form-control" >
            <small id="pworddiv" class="validations" ></small><br><br>
            <label>Confirm Password</label>
            <input type="password" id="cpword" name="cpword"  onblur="validatecpword()"class="form-control" >
            <div id="cpworddiv" class="validations" ></div><br><br>
            <button type="submit" name="Login" class="btn btn-primary">Register</button>
            </div>
        </form>
                    </div>
                    <div class="col-sm">
                        
                    </div>
            </div>   </div>
            </main>
            <%--<jsp:include page="footer.jsp"/>--%>
            <br><br>
    <script>
    //my
             function validateAll()
         {
             validatename();
             validateemail();
             validatephno();
             validatepword();
             validatecpword();
             var ret=true;
             if(document.getElementById("namediv").innerHTML !=="" )
             {
                 ret=false; 
             }
             if(document.getElementById("emaildiv").innerHTML !== "" )
             {
                 ret =false;
             }
             if(document.getElementById("phnodiv").innerHTML !== "")
             {
                 ret=false;
             }
             if(document.getElementById("pworddiv").innerHTML !== "")
             {
                 ret=false;
             }
             if(document.getElementById("cpworddiv").innerHTML !== "")
             {
                 ret=false;
             }
             return ret;
             
             
         }
            function isEmpty(val)
            {
                return (val === undefined || val === null || val.length <= 0 || val.equals("")) ? true : false;
            }
    
    function isEmpty(val)
           {
                return (val === undefined || val === null || val.length <= 0 || val.equals("")) ? true : false;
           }
    function validatename() {
        var xhttp;
        xhttp=new XMLHttpRequest();
        
    var x = document.getElementById("name").value;
    if(x.length<4)
    {
         document.getElementById("namediv").innerHTML = "Username too short!";
    }
    else
    {
        document.getElementById("namediv").innerHTML = "";
    }

}

function validateemail() {
          var x = document.getElementById("email").value;
          var atpos = x.indexOf("@");
          var dotpos = x.lastIndexOf(".");
          if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {


              document.getElementById("emaildiv").innerHTML = "Invalid email Address!";
          }
          else {
              
              document.getElementById("emaildiv").innerHTML = "";
          }
      }
      
 function validatephno(){
    var x=document.getElementById("phno").value;
  var phoneno = /^[0]?[789]\d{9}$/;
  if(x.match(phoneno))
  {
      document.getElementById("phnodiv").innerHTML = "";
  }
   else
  {
       document.getElementById("phnodiv").innerHTML = "Invalid Phone Number!";
        }
}

function validatepword() 
{ 
    var x=document.getElementById("pword").value;
var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
if(x.match(paswd)) 
{ 
      document.getElementById("pworddiv").innerHTML = "";
}
else
{ 
    document.getElementById("pworddiv").innerHTML = "Password must be between 7 and 15 characters. Must contain atleast one digit and special character!";

}
}

function validatecpword() 
{ 
    var x=document.getElementById("pword").value;
    var y=document.getElementById("cpword").value;

if(x===y) 
{ 
      document.getElementById("cpworddiv").innerHTML = "";
}
else
{ 
    document.getElementById("cpworddiv").innerHTML = "Passwords don't match!";

}
}</script>
    </body>
</html>

