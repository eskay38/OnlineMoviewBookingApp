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

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.onlinemovies.movies;
import javax.servlet.http.HttpSession;
/**
 *
 * @author IDBI
 */
@WebServlet(name = "moviedata", urlPatterns = {"/moviedata"})
public class moviedata extends HttpServlet 
{

    /**
     *
     */
    public ArrayList<movies> movie;

    public moviedata() throws SQLException 
    {
        try 
        {
            
            this.movie = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            String sql = "select * from movies_db";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                     
                     do
                     {
                        this.movie.add(new movies(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
                  
                    }while(rs.next());
                 }
            con.close();
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
               
    }
    
    public moviedata(String mn) throws SQLException 
    {
        try 
        {
            
            this.movie = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
//            String sql = "select * from movies_db where movie_name="+mn;
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            PreparedStatement st = con.prepareStatement("select * from movies_db where movie_name=?");
            st.setString(1,mn);
            ResultSet rs = st.executeQuery();
            
            if(rs.next()){
                     
                     do
                     {
                        this.movie.add(new movies(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
                  
                    }while(rs.next());
                 }
            con.close();
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
               
    }
    
    public ArrayList<movies> getMovieList()
    {
        return this.movie;
    }
}
