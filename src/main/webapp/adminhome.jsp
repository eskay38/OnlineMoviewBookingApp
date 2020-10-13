
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
    
    moviedata m = new moviedata();
    ArrayList<movies> list = m.getMovieList();
    
    
%>
<!DOCTYPE html>
<html>
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
        <title>Admin - Home</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
    <jsp:include page="header.jsp"/>
    
    <main>
        <div class="table-bg">
            <table class="table table-striped" >
  <tr>
    <th>Movie Title</th>
    <th>Certification</th>
    <th>Rating</th>
    <th>Genre</th>
    <th>Duration</th>
    <th>Language</th>
    <th>Action</th>
  </tr>
 <% 
    for(movies mov : list)
    {
        
  %>
        <tr>
          <td data-th="Movie Title"> <%= mov.getMovieName()%> </td>
          <td data-th="Certification"> <%= mov.getCertification()%> </td>
          <td data-th="Rating"> <%= mov.getRating()%> </td>
          <td data-th="Genre"> <%= mov.getGenre()%> </td>
          <td data-th="Duration"> <%= mov.getDuration()%> </td>
          <td data-th="Language"> <%= mov.getLanguage()%> </td>
          <td><a href="manageShow.jsp?movie=<%=mov.getMovieName()%>"><button type="button" class="btn btn-secondary">Manage Shows</button></a>&nbsp;<a href="deleteMovie?movie=<%= mov.getMovieName()%>"><button type="button" class="btn btn-secondary">Delete</button></a></td>
        </tr>
    
    
    <%
        }

    %>
 
    </table>
    </div>
    <br><br>
<!--    <div style="display: flex; justify-content: center;">
    <a href="addMovie.jsp"><button type="button" class="btn btn-success" >
        ADD MOVIE
    </button> </a>
        </div>-->
    </main>
    <br><br>
    <jsp:include page="footer.jsp"/>
   

    </body>
</html>