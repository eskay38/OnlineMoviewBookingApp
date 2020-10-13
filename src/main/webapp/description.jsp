

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>

<%
    String mn = (String)request.getParameter("movie");
    if(mn==null)
    {
        response.sendRedirect("welcome.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "descriptioncss.css" />
        <title>Booking History</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
        <style>
            
        </style>
    </head>
    <body>
        <%
            
            String curr_url = (request.getRequestURL()).toString();
            String params = (String) request.getQueryString();
                     String base ="http://localhost:8088/OnlineMovies/";
                     int len= base.length();
                     curr_url = curr_url.substring(len);
                     String next = "";
                     if(!curr_url.equals(""))
                     {
                        next = "?next="+curr_url;
                        if(params!=null && params.equals("")==false)
                        {
                            next = next+"?"+params;
                        }
                     }
             
           
            session.removeAttribute("movie");
                response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
                response.setHeader("Pragma","no-cache");
                response.setHeader("Expires","0");
            %>
        <jsp:include page="header.jsp"/>
        
        <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/data1" user="root" password="root"/>
        <sql:query var="rs" dataSource="${db}">select* from movies_db where movie_name="<%=mn%>"
        </sql:query>
            
        <c:forEach items="${rs.rows}" var="movie">
            <%--<c:set var="url" value="${movie.image}" />--%>
            <div class="div-img"> <img <c:set var="url" value="${movie.image}" /> width="30px" height="40px" /> </div>
            <c:set var="frame" value="${movie.trailer}"/>
 <%
    String url = (String)pageContext.getAttribute("url");
    String iframe = (String)pageContext.getAttribute("frame");
  %>
            <main class="container">
                
            <div class="left-column">
            <div class="trailer">
                <%=iframe%>
            </div>
            <div class="synopsis">
                    <h3>Synopsis</h3><br>
                    <p><c:out value="${movie.synopsis}"></c:out></p>
            </div>
            <div class="starcast">
                    <h3>Starcast</h3><br>
                    <p><c:out value="${movie.starcast}"></c:out></p>
            </div>
            <div class="director">
                    <h3>Director</h3><br>
                    <p><c:out value="${movie.director}"></c:out></p>
            </div>
            </div>
            <div class="right-column">
                <div class="movie-poster">
                    <image src="<%=url%>" height="400" width="300">
                </div>
                <div class="movie-desc">
                    <h1><c:out value="${movie.movie_name}"></c:out></h1>
                
                    <label>Genre:</label>  <span><c:out value="${movie.genre}"></c:out>
                    </span><br>
                
                    <label>Certification:</label>  <span><c:out value="${movie.certification}"></c:out>
                </span><br>
                
                    <label>Rating:</label>  <span><c:out value="${movie.rating}"></c:out>
                </span><br>
                
                    <label>Language:</label>  <span><c:out value="${movie.language}"></c:out>
                </span><br>
                
                    <label>Run time:</label>  <span><c:out value="${movie.duration}"></c:out>
                    </span><br>
                </div>
                <div class="book">
                <%
                  String ut = (String)session.getAttribute("user_type");
                  if(ut==null || ut.equalsIgnoreCase("Guest"))
                  {
                      out.write("   <a href=\"\" class=\"btn btn-basic\" disabled>Book Ticket</a>");
                  }
                  else{
                      %>
                       <a href="movieSession.jsp?mov=<%=mn%>" class="btn btn-danger">Book Ticket</a>
                       <%
                  }
                %>
                </div>
            </div>
            
            
            
        </c:forEach>
                </main>
            <br><br>
        <%--<jsp:include page="footer.jsp"/>--%>
    </body>
</html>
