<%-- 
    Document   : welcome
    Created on : 24 May, 2020, 3:34:36 PM
    Author     : IDBI
--%>

<%@page import = "java.util.ArrayList"%>
<%@page import= "com.mycompany.onlinemovies.show"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import = "com.mycompany.onlinemovies.fetchShows"%>
 <%@taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
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
        <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
        <title>Shows</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    <body>
        
    <jsp:include page="header.jsp"/>
    
    <main>
        
        <%
            String u_type = (String) session.getAttribute("user_type");
            if(u_type==null || u_type.equalsIgnoreCase("Guest"))
            {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
            response.setHeader("Pragma","no-cache");
            response.setHeader("Expires","0");
            
            String mn = (String)session.getAttribute("movie");
            
            if(mn==null || mn.equals(""))
            {
                response.sendRedirect("welcome.jsp");
            }

            fetchShows s = new fetchShows(mn); 
            ArrayList<show> list = s.getShowList();
            int i=0;
            %>
            
            <h1>Theatres showing <%=mn%></h1><br>
            <div class="container">
          
         <%
            for(show obj : list)
            {
          %>
             
	<div class="movie-card">
		
			<div class="header-icon-container">
				<a href="seatbook2.jsp?showid=<%=obj.getShowId()%>">
					<i class="material-icons header-icon"></i>
				</a>
			</div>
		
		<div class="movie-content">
			<div class="movie-content-header">
				<a href="seatbook2.jsp?showid=<%=obj.getShowId()%>">
					<h3 class="movie-title"><%=obj.getShowTheatre()%></h3>
				</a>
				<div class="imax-logo"></div>
			</div>
			<div class="movie-info">
				<div class="info-section">
					<label>Address</label>
					<span><%=obj.getShowAddress()%></span>
				</div><!--date,time-->
				<div class="info-section">
					<label>Screen</label>
					<span><%=obj.getShowScreen()%></span>
				</div><!--screen-->
				<div class="info-section">
					<label>Start Time</label>
					<span><%=obj.getShowStartTime()%></span>
				</div><!--row-->
				<div class="info-section">
					<label>End Time</label>
					<span><%=obj.getShowEndTime()%></span>
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

