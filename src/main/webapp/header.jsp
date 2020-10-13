
<%-- 
    Document   : header
    Created on : 06-Apr-2020, 11:40:19 am
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
         <!--<link rel = "stylesheet" type = "text/css" href = "myStyle.css" />-->
         <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <title></title>
        
        <style>
            
            html,body { height: 100%;  margin: 0; }
            .navbar-text
            {
                font-family : "Lobster";
                font-size: 30px;
                margin-top: 2px;
                margin-bottom: 2px;
                padding-top: 2px;
                padding-bottom: 2px;
                padding-right: 6px;
            }
            .navbar navbar-expand-lg navbar-dark bg-dark
            {
                background-color: rgb(128,0,0);
            }
            .container-fluid
            {
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <%
            String home_url="welcome.jsp";
            String utype= (String)session.getAttribute("user_type");
            if(utype!=null && utype.equalsIgnoreCase("ADMIN"))
            {
                home_url = "adminhome.jsp";
            }
          %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="index.jsp">
                <span class="navbar-text" >
                    Movie Mania
                </span>
            </a>
                <!--<a class="navbar-brand" href="#">Navbar w/ text</a>-->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText" >
                    
                 <%
                     String curr_url = (request.getRequestURL()).toString();
                     String base ="http://localhost:8088/OnlineMovies/";
                     int len= base.length();
                     curr_url = curr_url.substring(len);
                     if(!curr_url.equals(""))
                     {
                        curr_url=curr_url.substring(0 , curr_url.indexOf("."));
                     }
                     
                  %>
                    
                    <ul class="navbar-nav mr-auto">
                        <% if(curr_url.equals("adminhome") || curr_url.equals("welcome"))
                            {
                          %>
                            <li class="nav-item active">
                        <%
                            }
                            else
                            {
                         %>
                                <li class="nav-item">
                            <%
                                }
                            %>
                            
                            <a class="nav-link" href=<%= home_url%>>Home <span class="sr-only">(current)</span></a>
                        </li>
                        <%
                            
                            if(home_url.equals("adminhome.jsp"))
                            {
                         %>
                         
                            <% if(curr_url.equals("addMovie"))
                            {
                                %>
                                  <li class="nav-item active">
                              <%
                                  }
                                  else
                                  {
                               %>
                                      <li class="nav-item">
                            <%
                                }
                            %>
                                
                                  <a class="nav-link" href="addMovie.jsp">Add Movie</a>
                                </li>
                                
                                
                                <% if(curr_url.equals("bookings"))
                            {
                          %>
                            <li class="nav-item active">
                        <%
                            }
                            else
                            {
                         %>
                                <li class="nav-item">
                            <%
                                }
                            %>
                                  <a class="nav-link" href="bookings.jsp">View All Bookings</a>
                                </li>
                         
                         <%
                            }
                            else if(utype!=null && utype.equalsIgnoreCase("User"))
                            {
                                if(curr_url.equals("bookingHistory"))
                                {
                                %>
                                 <li class="nav-item active">
                                <%
                                    }
                                    else
                                    {
                                 %>
                                        <li class="nav-item">
                                    <%
                                        }
                                    %>
                                          <a class="nav-link" href="bookingHistory.jsp">Booking History</a>
                                        </li>
                            <%
                                    }
                          %>
                    </ul>

                </div>
                
                <%
                    String url="login.jsp";
                    String path = (String)request.getRequestURI();
                    String next=null;
                    next = path.substring(path.lastIndexOf("/")+1);
                    if(next!=null && !next.equals(""))
                    {
                        url = url+"?next="+next;
                    }
                    
                    
                    String name = (String)session.getAttribute("name") ;
                    
                    if(name == null )
                    {
                        if(!curr_url.equals("login"))
                        {
                %>      
                        <a class="navbar-brand" href="<%=url%>">Login</a>
                   <%
                        }
                        if(!curr_url.equals("register"))
                        {
                   %>
                        <a class="navbar-brand" href="register.jsp">Sign Up</a>
                <%
                        }
                    }
                    else
                    {
                %>
                        <a class="navbar-brand" href="logout.jsp">Logout</a>
                    
                <%
                     }
                %>
        </nav>
        
    </body>
</html>
