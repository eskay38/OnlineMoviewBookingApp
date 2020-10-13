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
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "deleteMovie", urlPatterns = {"/deleteMovie"})
public class deleteMovie extends HttpServlet 
{

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        String chosen=(String)request.getParameter("movie");
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data1", "root", "root");
            PreparedStatement st=conn.prepareStatement("DELETE FROM movies_db WHERE movie_name=?");
            st.setString(1,chosen);
            int i=st.executeUpdate();
            
            String sql="select * from shows where movie_name=?";    
            PreparedStatement st1 = conn.prepareStatement(sql);
            st1.setString(1,chosen);
            ResultSet rs = st1.executeQuery();
            String t_name,start_time,slot;
            int screen;
            String sql1= "";
            while(rs.next())
            {
                sql1="";
                t_name=rs.getString(3);
                screen = rs.getInt(4);
                start_time=rs.getString(5);
                if(start_time.equals("9:00 am"))
                {
                    sql1="UPDATE "+t_name+" SET slot1=? WHERE screen=?";
                    slot="slot1";
                }
                else if(start_time.equals("12:45 pm"))
                {
                    sql1="UPDATE "+t_name+" SET slot2=? WHERE screen=?";
                    slot="slot2";
                }
                else if(start_time.equals("4:30 pm"))
                {
                    sql1="UPDATE "+t_name+" SET slot3=? WHERE screen=?";
                    slot="slot3";
                }
                else if(start_time.equals("8:15 pm"))
                {
                    sql1="UPDATE "+t_name+" SET slot4=? WHERE screen=?";
                    slot="slot4";
                }
                else
                {
                    slot= null;
                }
                
                if(slot!=null)
                {
                    
                    PreparedStatement st2 = conn.prepareStatement(sql1);
                    st2.setString(1,"YES");
                    st2.setInt(2,screen);
                    st2.executeUpdate();
                }
                
                
            }
            
            st=conn.prepareStatement("DELETE FROM shows WHERE movie_name=?");
            st.setString(1,chosen);
            i=st.executeUpdate();
            response.sendRedirect(request.getContextPath()+"/adminhome.jsp");
        }
        catch(Exception e)
        {
            response.sendRedirect(request.getContextPath()+"/adminhome.jsp");
            System.out.print(e);
            e.printStackTrace();
        }
    }

}
