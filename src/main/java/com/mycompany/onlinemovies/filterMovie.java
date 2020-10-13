/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.onlinemovies;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mycompany.onlinemovies.movies;
import com.mycompany.onlinemovies.moviedata;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "filterMovie", urlPatterns = {"/filterMovie"})
public class filterMovie extends HttpServlet 
{

    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        try 
        {
            String m2 =(String) request.getParameter("search");
            m2=m2.toLowerCase();
            moviedata dat = new moviedata();
            ArrayList<movies> movs = dat.getMovieList();
            int flag=0;
            String mn="";
            for(movies movie : movs)
            {
                 mn = movie.getMovieName();
                if((mn.toLowerCase()).contains(m2))
                {
                    flag=1;
                    break;
                }
            }
            if(flag==0)
            {
                response.sendRedirect("welcome.jsp");
            }
            else
            {
                response.sendRedirect("welcome.jsp?filter="+mn);
            }
            
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(filterMovie.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("welcome.jsp");
        }
        
    }

}
