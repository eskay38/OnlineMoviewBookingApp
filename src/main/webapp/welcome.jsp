<%-- 
    Document   : welcome
    Created on : 24 May, 2020, 3:34:36 PM
    Author     : IDBI
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.onlinemovies.movies"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import = "com.mycompany.onlinemovies.moviedata" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "welcomescreen.css" />
        <link rel = "stylesheet" type = "text/css" href = "main.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <title>Movie Mania - HOME </title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
        
        <style>
            .search-container button 
            {
                
                /*padding: 6px 10px;*/
                margin-top: 8px;
                /*margin-right: 16px;*/
                background: #ddd;
                font-size: 17px;
                border: none;
                cursor: pointer;
            }
            .search-container button:hover 
            {
                background: #ccc;
            }
              
            input[type=text] 
            {
                /*padding: 6px;*/
                margin-top: 8px;
                font-size: 17px;
                border: 1px solid #ccc; 
            }
            input[type=text],.search-container button 
            {
                
                /*display: block;*/
                /*text-align: left;*/
                margin: 0;
                padding: 14px;
              }
             .search-container
             {
                 display: block;
             }
             
        </style>
    </head>
    <body>
        
    <jsp:include page="header.jsp"/>
    <br>
    
    <span class="search-container" style="color: whitesmoke; display: flex; justify-content: center;">
        <form action="filterMovie" method="get">
          <input type="text" placeholder="Search Movie" name="search" id="search">
          <button type="submit"><i class="fa fa-search"></i></button>
        </form>
    </span>
    <br>
        <span style="font-size: 55px;color: whitesmoke; display: flex; justify-content: center; font-family: Lobster;">Now Showing ...</span>
        <main>
        <%
            session.removeAttribute("movie");
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
            
            String mn = request.getParameter("filter");
            moviedata m;
            ArrayList<movies> list;
            if(mn==null || mn.equals(""))
            {
                m = new moviedata();
                list = m.getMovieList();
            }
            else
            {
                m = new moviedata(mn);
                list = m.getMovieList();
            }
            int i=0;
            %>
            
            <div class="container">
          
         <%
            for(movies obj : list)
            {
                 
                     %>
               
	<div class="movie-card">
		<div class="movie-header" style="background: url(<%=obj.getImage()%>); background-size: cover;">
			<div class="header-icon-container">
				<a href="description.jsp?movie=<%=obj.getMovieName()%>">
					<i class="material-icons header-icon"></i>
				</a>
			</div>
		</div><!--movie-header-->
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="description.jsp?movie=<%=obj.getMovieName()%>">
					<h3 class="movie-title"><%=obj.getMovieName()%></h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Certification</label>
					<span><%=obj.getCertification()%></span>
				</div><!--date,time-->
				<div class="info-section">
					<label>Rating</label>
					<span><%=obj.getRating()%></span>
				</div><!--screen-->
				<div class="info-section">
					<label>Language</label>
					<span><%=obj.getLanguage()%></span>
				</div><!--row-->
				<div class="info-section">
					<label>Genre</label>
					<span><%=obj.getGenre()%></span>
				</div><!--seat-->
			</div>
		</div><!--movie-content-->
	</div><!--movie-card-->
	
        


<%        
   }

%>
</div><!--container-->
</main>
                                <br><br>
    <jsp:include page="footer.jsp"/>
    </body>
</html>
