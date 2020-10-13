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
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
@WebServlet(name = "deleteShow", urlPatterns = {"/deleteShow"})
public class deleteShow extends HttpServlet 
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String theatre,sl;
        String mov="";
        theatre=sl="";
        int screen;
        screen=0;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data1", "root", "root");
            PreparedStatement st=conn.prepareStatement("SELECT * FROM shows WHERE id=?");
            st.setInt(1,id);
            ResultSet rs = st.executeQuery();
            if(rs.next())
            {
                mov=rs.getString(2);
                theatre = rs.getString(3);
                screen = rs.getInt(4);
                sl = rs.getString(5);
                String sql = "";
                if(sl.equalsIgnoreCase("9:00 am"))
                {
                    sql = "UPDATE "+theatre+" SET slot1=? WHERE screen=?";
                    sl="slot1";
                }
                else if(sl.equalsIgnoreCase("12:45 pm"))
                {
                    sql = "UPDATE "+theatre+" SET slot2=? WHERE screen=?";
                    sl="slot2";
                }
                else if(sl.equalsIgnoreCase("4:30 pm"))
                {
                    sql = "UPDATE "+theatre+" SET slot3=? WHERE screen=?";
                    sl="slot3";
                }
                else if(sl.equalsIgnoreCase("8:15 pm"))
                {
                    sql = "UPDATE "+theatre+" SET slot4=? WHERE screen=?";
                    sl="slot4";
                }
                else
                {
                    sl="slot";
                }

                st=conn.prepareStatement("DELETE FROM shows WHERE id=?");
                st.setInt(1,id);
                int i=st.executeUpdate();
                
                PreparedStatement st1 =  conn.prepareStatement(sql);
                st1.setString(1,"YES");
                st1.setInt(2,screen);
                st1.executeUpdate();
            }
//            response.sendRedirect("adminhome.jsp");
              response.sendRedirect("manageShow.jsp?movie="+mov);

        }
        catch(Exception e)
        {
            response.sendRedirect(request.getContextPath()+"/adminhome.jsp");
            System.out.print(e);
            e.printStackTrace();
        }
    }

}
