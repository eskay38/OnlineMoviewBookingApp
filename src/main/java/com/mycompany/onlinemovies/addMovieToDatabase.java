/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.onlinemovies;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "addMovieToDatabase", urlPatterns = {"/addMovieToDatabase"})
public class addMovieToDatabase extends HttpServlet 
{
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        
            String name,certification,duration,rating,star_cast,director,image,trailer,genre,synopsis,language;
            name= (String) request.getParameter("moviename");
            certification = (String)  request.getParameter("certification");
            rating =  (String) request.getParameter("rating");
            genre = (String)  request.getParameter("genre");
            duration= (String) request.getParameter("duration");
            star_cast = (String)  request.getParameter("star_cast");
            director =  (String) request.getParameter("director");
            synopsis =  (String) request.getParameter("synopsis");
            language = (String)  request.getParameter("language");
            image = (String)  request.getParameter("image");
            trailer =  (String) request.getParameter("trailer");
            
            image = "proj_images/" + image;
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
        
        try 
        {
            String sql = "INSERT INTO movies_db(movie_name,certification,rating,genre,duration,starcast,director,synopsis,language,image,trailer)"+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,name);
            st.setString(2,certification);
            st.setString(3,rating);
            st.setString(4,genre);
            st.setString(5,duration);
            st.setString(6,star_cast);
            st.setString(7,director);
            st.setString(8,synopsis);
            st.setString(9,language);
            st.setString(10,image);
            st.setString(11,trailer);
            
            st.executeUpdate();
            
            con.close();
        } 
        catch (ClassNotFoundException ex) 
        {
                Logger.getLogger(verify.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (SQLException ex) 
        {
               Logger.getLogger(verify.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect(request.getContextPath()+"/adminhome.jsp");
    }

}
