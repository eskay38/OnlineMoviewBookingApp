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
@WebServlet(name = "addShow", urlPatterns = {"/addShow"})
public class addShow extends HttpServlet 
{
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        try 
        {
            response.setContentType("text/html;charset=UTF-8");
            
            String movie= request.getParameter("movie");
            String tname = request.getParameter("theatre");
            int screen = Integer.parseInt(request.getParameter("screen"));
            int avail_seats = Integer.parseInt(request.getParameter("avail"));
            String sl = request.getParameter("slot");
            String addr = request.getParameter("address");
            String startTime,endTime;
            startTime=endTime="";
            String sql1="";
            
            int n1,n2,n3;
            n1=n2=n3 = avail_seats/3;
            if(avail_seats%3 ==1)
            {
                n3++;
            }
            else if(avail_seats%3 ==2)
            {
                n2++;
                n3++;
            }
            
            if(sl.equalsIgnoreCase("slot1"))
            {
                sql1 = "UPDATE "+tname+" SET slot1=? WHERE screen=?";
                startTime = "9:00 am";
                endTime = "12:30 pm";
            }
            else if(sl.equalsIgnoreCase("slot2"))
            {
                sql1 = "UPDATE "+tname+" SET slot2=? WHERE screen=?";
                startTime = "12:45 pm";
                endTime = "4:15 pm";
            }
            else if(sl.equalsIgnoreCase("slot3"))
            {
                sql1 = "UPDATE "+tname+" SET slot3=? WHERE screen=?";
                startTime = "4:30 pm";
                endTime = "8:00 pm";
            }
            else if(sl.equalsIgnoreCase("slot4"))
            {
                sql1 = "UPDATE "+tname+" SET slot4=? WHERE screen=?";
                startTime = "8:15 pm";
                endTime = "11:45 pm";
            }
            
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            String sql = "INSERT INTO shows(movie_name,theatre_name,screen,start_time,end_time,gold,prime,classic,address)"+ " VALUES(?,?,?,?,?,?,?,?,?)";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,movie);
            st.setString(2,tname);
            st.setInt(3,screen);
            st.setString(4,startTime);
            st.setString(5,endTime);
            st.setInt(6,n1);
            st.setInt(7,n2);
            st.setInt(8,n3);
            st.setString(9,addr);
            st.executeUpdate();
            
            PreparedStatement st1 = con.prepareStatement(sql1);
            st1.setString(1,"NO");
            st1.setInt(2,screen);
            st1.executeUpdate();
            
//            response.sendRedirect("adminhome.jsp");
              response.sendRedirect("manageShow.jsp?movie="+movie);
            
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(addShow.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
