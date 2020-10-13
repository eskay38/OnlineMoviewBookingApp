<%-- 
    Document   : finalticket
    Created on : 16 Jun, 2020, 3:24:15 PM
    Author     : IDBI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "com.mycompany.onlinemovies.ticket"%>
<%@page import= "com.mycompany.onlinemovies.getTicket"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "ticket.css" />
        <link rel = "stylesheet" type = "text/css" href = "main.css" />
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <title>Ticket</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    <body>
        <%
            String u_type = (String) session.getAttribute("user_type");
            if(u_type==null || u_type.equalsIgnoreCase("Guest"))
            {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
            
            String id = (String)request.getParameter("tid");
            if(id==null || id.equals(""))
            {
                response.sendRedirect("welcome.jsp");
            }
            getTicket t = new getTicket(id);
            ticket ti = t.retTickets();
            if(ti==null)
            {
                response.sendRedirect("welcome.jsp");
            }
            String sessuser,sessphone;
            sessuser = (String) session.getAttribute("name");
            sessphone = (String) session.getAttribute("phone");
            
            if(!((ti.getUserName()).equals(sessuser)) || !((ti.getPhone()).equals(sessphone)))
            {
                response.sendRedirect("welcome.jsp");
            }
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
        %>
        <br><br><br>
        <div class="container">
            
                <div class="left-column">
                    <image src="<%=ti.image%>" width="450" height="450">
    
                </div>
                <div class="right-column">
                    <div class="movie-desc">
                      <!----  <div class="row"> --->
                            <h1><%=ti.movie_name%></h1>
                            <h3><%=ti.rating%></h3>
                            <h3><%=ti.duration%></h3><br>
                     <!----   </div>    --->
                     <!----   <div class="row"> --->
                            <h2>Show details</h2>
                            <label>Theatre : </label><span><%=ti.theatre%>, <%=ti.address%> &nbsp; &nbsp;</span>
                            <label>Time : </label><span><%=ti.show_time%> &nbsp; &nbsp;</span>
                            <label>Screen : </label><span><%=ti.screen%> </span><br><br>
                    <!----    </div>    --->
                    <!----    <div class="row"> --->
                            <h2>Booking details</h2>
                            <label>No. of seats : </label><span><%=ti.seats%> &nbsp; &nbsp;</span>
                            <label>Category : </label><span><%=ti.category%> &nbsp; &nbsp;</span>
                            <label>Price(INR) : </label><span><%=ti.price%> &nbsp; &nbsp;</span><br>
                            <label>Booking ID : </label><span><%=ti.ID%> &nbsp; &nbsp;</span>
                            <label>Name of Customer : </label><span><%=ti.user_name%> </span><br>
                           
                    <!----    </div>    --->
                    </div>
                </div>
            
            
            
        </div>
                            <div class="container">
                                Your ticket booking has been confirmed! Save a screenshot of the ticket. &nbsp; &nbsp;
                                <a href="welcome.jsp" class="btn btn-primary">Click here to go back to home screen</a>
                            </div>
    </body>
</html>
