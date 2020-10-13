<%-- 
    Document   : form
    Created on : 04-Apr-2020, 9:25:38 pm
    Author     : Lenovo
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
        <title>ADD MOVIE</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
        <style>
             .validations
            {
                font-family : "Lobster";
                font-size: 15px;
                color: rgb(255, 99, 71);
            }
         </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <br><br>
               <!--<div class="container-fluid">-->
               <main style="color:white">
               <%
                    String name,type;
                    name = (String)session.getAttribute("name");
                    type = (String)session.getAttribute("user_type");
                    if(type==null ||  !(type.equalsIgnoreCase("ADMIN")))
                    {
                        response.sendRedirect("login.jsp?next=addMovie.jsp");
                    }

                    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
                    response.setHeader("Pragma","no-cache");
                    response.setHeader("Expires","0");

                    
            %>
               
            <div class="row">
                <div class="col-sm">
                </div>
                <div class="col-sm">
        <form action="addMovieToDatabase" method="post"> 
              
            <div class="form-group">
                
                 <div class="row">
        <div class="span6" style="float: none; margin: 0 auto;">
                    <h2>ADD MOVIE</h2>
                </div>
                 </div>





            <label>Movie Name</label> 
            <input type="text" name="moviename" id="moviename" onblur="validatemname()" class="form-control" >
            <small id="namediv" class="validations" ></small><br><br>

            <label>Certification</label> 
            <input type="text" id="certificate" onblur="validatecertificate()" name="certification" class="form-control" >
             <small id="certificatediv" class="validations" ></small><br><br>

            <label>Rating</label> 
            <input type="text" name="rating" id="rating" class="form-control" >
             <!--<div id="ratingdiv" class="validations" ></div>-->
             <br><br>

            <label>Genre</label> 
            <input type="text" name="genre" class="form-control" >
             <!--<div id="genrediv" class="validations" ></div>-->
             <br><br>

            <label>Duration</label> 
            <input type="text" name="duration" id="duration"  class="form-control" >
             <!--<small id="durationdiv" class="validations" ></small>-->
             <br><br>

            <label>Star Cast</label> 
            <input type="text" name="star_cast" class="form-control" >
             <!--<div id="starcastdiv" class="validations" ></div>-->
             <br><br>
            
            <label>Director</label> 
            <input type="text" name="director" class="form-control" >
             <!--<div id="dirdiv" class="validations" ></div>-->
             <br><br>
            
            <label>Synopsis</label> 
            <input type="text" name="synopsis" class="form-control" >
             <!--<div id="syndiv" class="validations" ></div>-->
             <br><br>
            
            <label>Language</label> 
            <input type="text" name="language" class="form-control" >
             <!--<div id="landiv" class="validations" ></div>-->
             <br><br>
            
            <label>Select Photo</label> 
            <input type="file" name="image" class="form-control" >
             <!--<div id="photodiv" class="validations" ></div>-->
             <br><br>
            
            <label>Trailer Link (Embed) </label> 
            <input type="text" name="trailer" class="form-control" ><br><br>
            
            <button type="submit" name="addmovie" class="btn btn-primary">ADD</button>

             
               
            </div>
        </form>
                    </div>
                    <div class="col-sm">
                        
                    </div>
        </div>
            
            </main>
            <br>
            <%--<jsp:include page="footer.jsp"/>--%>
            
            <script>
                function validatemname() 
                {
                    var x = document.getElementById("moviename").value;
                    if(x.length<1)
                    {
                         document.getElementById("namediv").innerHTML = "Enter moviename!";
                    }
                    else
                    {
                        document.getElementById("namediv").innerHTML = "";
                    }

                }
                function validaterating()
                {
                        var x = parseFloat(document.getElementById("rating").value);
                        x= Math.round(x*10);
                        if(x>100 || x<0)
                        {
                            document.getElementById("ratingdiv").innerHTML = "Rating should be between 0 and 10!";
                        }
                        else
                    {
                        document.getElementById("ratingdiv").innerHTML = "";
                    }


                }

                function validatecertificate()
                {
                        var x =(document.getElementById("certificate").value);

                        if(x==="U" || x==="A" || x==="U/A")
                        {
                            document.getElementById("certificatediv").innerHTML = "";

                        }
                        else
                    {
                        document.getElementById("certificatediv").innerHTML = "Invalid Certificate!";
                    }


                }

                function validateduration()
                {
                        var x =(document.getElementById("duration").value);
                        var y=/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/ ;
                        if(x.match(y))
                        {
                            document.getElementById("durationdiv").innerHTML = "";

                        }
                        else
                        {
                            document.getElementById("durationdiv").innerHTML = "Enter in H:MM format!";
                        }
                }
            </script>
    </body>
</html>