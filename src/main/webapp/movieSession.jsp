<%-- 
    Document   : movieSession
    Created on : 16-Jun-2020, 9:37:52 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Mania</title>
        <link rel = "icon" href ="proj_images/moviemania.jpg" type = "image/x-icon"> 
    </head>
    <body>
        <%
            String u_type = (String) session.getAttribute("user_type");
            if(u_type==null || u_type.equalsIgnoreCase("Guest"))
            {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
            else
            {
                session.removeAttribute("movie");
                String mov = (String) request.getParameter("mov");
                if(mov==null || mov.equals(""))
                {
                    response.sendRedirect("welcome.jsp");
                }
                else
                {
                    session.setAttribute("movie",mov);
                    response.sendRedirect("showsavailable.jsp");
                }
            }
                
            
        %>
    </body>
</html>
