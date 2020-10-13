<%-- 
    Document   : logout
    Created on : 24-May-2020, 3:47:13 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    <body>
        <%
            
            //session= request.getSession();
            session.removeAttribute("name");
            session.removeAttribute("phone");
            session.removeAttribute("user_type");
            session.removeAttribute("movie");
            session.invalidate();
            response.sendRedirect("login.jsp");
            %>
    </body>
</html>
