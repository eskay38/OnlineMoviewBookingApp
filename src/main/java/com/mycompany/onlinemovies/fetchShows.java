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
import java.util.ArrayList;
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
@WebServlet(name = "fetchShow", urlPatterns = {"/fetchShow"})
public class fetchShows extends HttpServlet 
{

    public ArrayList<show> shows;
    public show showwatch;
    
    public fetchShows()
    {
        
    }
    
    public fetchShows(String mname) throws SQLException 
    {
    	//String moviename=
    	//String moviename="Dangal";
        try 
        {
            
            this.shows = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            //String sql = "select * from shows where moviename=?";
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(url,username,password)) {
                String sql = "select * from shows where movie_name=?";
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, mname);
                ResultSet rs = st.executeQuery();
                
                if(rs.next())
                {
                    do
                    {
                        this.shows.add(new show(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(10),rs.getInt(7),rs.getInt(8),rs.getInt(9)));
                        
                    }while(rs.next());
                }
            }
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
               
    }
    
    public fetchShows(int showid) throws SQLException 
    {
    	//String moviename=
    	//String moviename="Dangal";
        try 
        {
            
            this.shows = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            //String sql = "select * from shows where moviename=?";
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(url,username,password)) {
                String sql = "select * from shows where ID="+String.valueOf(showid);
                PreparedStatement st = con.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                
                if(rs.next())
                {
                    do
                    {
                        this.showwatch = new show(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getString(10),rs.getInt(7),rs.getInt(8),rs.getInt(9));
                        
                    }while(rs.next());
                }
            }
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
               
    }
    
    public ArrayList<show> getShowList()
    {
        return this.shows;
    }
    
    public show ShowWatch()
    {
        return this.showwatch;
    }

}
