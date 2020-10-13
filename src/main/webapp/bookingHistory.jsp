<%-- 
    Document   : bookings
    Created on : 16-Jun-2020, 7:48:49 pm
    Author     : Lenovo
--%>

<%@page import="com.mycompany.onlinemovies.getBookings"%>
<%@page import="com.mycompany.onlinemovies.ticket"%>
<%@page import="com.mycompany.onlinemovies.movies"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.onlinemovies.moviedata"%>
<%
    String name,type,phno;
    name = (String)session.getAttribute("name");
    type = (String)session.getAttribute("user_type");
    phno = (String)session.getAttribute("phone");
    if(type==null ||  !(type.equalsIgnoreCase("USER")))
    {
               response.sendRedirect("login.jsp?next=bookingHistory.jsp");
    }
            
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setHeader("Expires","0");
    
    getBookings obj = new getBookings(name,phno);
    ArrayList<ticket> list = obj.getBookingList();
    
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "main.css" />
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
        <title>Booking History</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    
    <body>
        
        <jsp:include page="header.jsp"/>
    
    <main>
        <div class="table-bg">
            <table class="table table-striped" >
  <tr>
    <!--<th>User Name</th>-->
    <th>Movie</th>
    <!--<th>Phone No.</th>-->
    <th>Theatre</th>
    <th>Screen</th>
    <th>Show Time</th>
    <th>Category</th>
    <th>No. Of Seats </th>
    <th>Total Price</th>
    
  </tr>
 <% 
    for(ticket t : list)
    {
        
  %>
        <tr>
          <!--<td data-th="User Name"> <%= t.getUserName()%> </td>-->
          <td data-th="Movie"> <%= t.getMovieName()%> </td>
          <!--<td data-th="Phone No."> <%= t.getPhone()%> </td>-->
          <td data-th="Theatre"> <%= t.getTheatre()%> </td>
          <td data-th="Screen"> <%= t.getScreen()%> </td>
          <td data-th="Show Time"> <%= t.getShowTime()%> </td>
          <td data-th="Category"> <%= t.getCategory()%> </td>
          <td data-th="No. Of Seats"> <%= t.getSeats()%> </td>
          <td data-th="Total Price"> <%= t.getPrice()%> </td>
        </tr>
    
    
    <%
        }

    %>
 
    </table>
    </div>
    <br><br>
   
    </main>
    <br><br>
    <jsp:include page="footer.jsp"/>
   
        
    </body>
</html>
