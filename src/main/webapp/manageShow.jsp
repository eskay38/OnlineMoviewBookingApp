<%-- 
    Document   : manageShow
    Created on : 08-Jun-2020, 7:59:37 pm
    Author     : Lenovo
--%>

<%@page import="com.mycompany.onlinemovies.slots"%>
<%@page import="com.mycompany.onlinemovies.availableSlots"%>
<%@page import="com.mycompany.onlinemovies.show"%>
<%@page import="com.mycompany.onlinemovies.fetchShows"%>
<%@page import="com.mycompany.onlinemovies.movies"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.onlinemovies.moviedata"%>
<%
    
    String name,type;
    name = (String)session.getAttribute("name");
    type = (String)session.getAttribute("user_type");
    if(type==null ||  !(type.equalsIgnoreCase("ADMIN")))
    {
               response.sendRedirect("login.jsp");
    }
            
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Expires","0");
    
    String movie_name = (String) request.getParameter("movie");
    if(movie_name==null)
    {
        response.sendRedirect("adminhome.jsp");
    }
    
    fetchShows obj = new fetchShows(movie_name);
    ArrayList<show> shows = obj.getShowList();
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "main.css" />
        <title> Manage Shows - <%=movie_name%> </title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
        <style>
            .table-bg
            {
                background: rgba(0,0,0,0.7);
                padding : 20px 20px 20px 20px;
            }
            th
            {
                color : #ffff33;
                font-size: 25px;
            }
            td
            {
                color : #ccffe6;
                font-size: 20px;
            }
        </style>
    </head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <body>
        
        <jsp:include page="header.jsp"/>

            <main>
                <div class="table-bg">
                    <h2 style="display: flex; justify-content: center;"> Existing Shows for <%=movie_name%> </h2>
                    <table class="table table-striped" >
                        <tr>
                          <th>Theatre</th>
                          <th>Screen</th>
                          <th>Timing</th>
                          <th>Available Seats</th>
                          <th>Address of Theatre</th>
                        </tr>
                       <% 
                          for(show s : shows)
                          {

                        %>
                              <tr>
                                <td data-th="Theatre"> <%= s.getShowTheatre().substring(0, 1).toUpperCase() + s.getShowTheatre().substring(1)%> </td> 
                                <td data-th="Screen"> <%= s.getShowScreen()%> </td>
                                <td data-th="Timing"> <%=s.getShowStartTime()%> - <%=s.getShowEndTime()%> </td>
                                <td data-th="Available Seats"> <%= s.getShowAvailableSeats()%> </td>
                                <td data-th="Address of Theatre"> <%= s.getShowAddress()%> </td>
                                <td><a href="deleteShow?id=<%=s.getShowId()%>"><button type="button" class="btn btn-secondary">Delete Show</button></a></td>
                              </tr>


                          <%
                              }

                          %>

                          </table>
                          </div>
                          <br><br><br>
                          
                          <%
                                availableSlots ob = new availableSlots();
                                ArrayList<slots> slot = ob.getFreeSlotList();

                           %>
                    
                    <div class="table-bg">
                        <h2 style="display: flex; justify-content: center;"> Add New Shows for <%=movie_name%> </h2>
                      <table class="table table-striped" >
                        <tr>
                          <th>Theatre</th>
                          <th>Screen</th>
                          <th>Timing</th>
                          <th>Available Seats</th>
                          <th>Address of Theatre</th>
                        </tr>
                       <% 
                           String sl_time="";
                           int key=0;
                          for(slots s : slot)
                          {
                               sl_time=s.getFreeSlot();
                               String sl=sl_time;
                               if(sl.startsWith("9:00 am"))
                               {
                                   sl="slot1";
                               }
                               else if(sl.startsWith("12:45 pm"))
                               {
                                   sl="slot2";
                               }
                               else if(sl.startsWith("4:30 pm"))
                               {
                                   sl="slot3";
                               }
                               else if(sl.startsWith("8:15 pm"))
                               {
                                   sl="slot4";
                               }
                               String tname =s.getFreeSlotTheatre().substring(0,1).toUpperCase() + s.getFreeSlotTheatre().substring(1);
                               String tn2= tname.toLowerCase();
                               int screen_no = s.getFreeSlotScreen();
                               int seats=s.getFreeSlotTotalSeats();
                               String addr = s.getFreeSlotAddress();
                        %>
                              <tr>
                                <td data-th="Theatre"> <%=tname %> </td>
                                <td data-th="Screen"> <%= screen_no%> </td>
                                <td data-th="Timing"> <%=sl_time%> </td>
                                <td data-th="Available Seats"> <%=seats %> </td>
                                <td data-th="Address of Theatre"> <%= addr%> </td>
                                <td><a href="addShow?movie=<%=movie_name%>&theatre=<%=tn2%>&screen=<%=screen_no%>&slot=<%=sl%>&avail=<%=seats%>&address=<%=addr%>"><button type="button" class="btn btn-secondary">Add Show</button></a></td>
                              </tr>


                          <%    key++;
                              }

                          %>

                          </table>
                        </div>
            </main>
            <br><br>
            <jsp:include page="footer.jsp"/>
   

    </body>
</html>
