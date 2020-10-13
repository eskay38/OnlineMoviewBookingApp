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
import java.sql.ResultSet;
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
@WebServlet(name = "getBookings", urlPatterns = {"/getBookings"})
public class getBookings extends HttpServlet 
{
     private ArrayList<ticket> tick;
    public getBookings()
    {
        try 
        {
            
            this.tick = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            String sql = "select * from ticketbooked";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next())
            {
                     
                do
                {
                    this.tick.add(new ticket(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14)));
                  
                }while(rs.next());
            }
            con.close();
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public getBookings(String name,String phone)
    {
        try 
        {
            
            this.tick = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            String sql = "select * from ticketbooked";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next())
            {        
                do
                {
                    if(rs.getString(3).equals(name) && rs.getString(4).equals(phone))
                    {
                        this.tick.add(new ticket(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14)));
                    }
                }while(rs.next());
            }
            con.close();
        } 
        catch (Exception ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<ticket> getBookingList()
    {
        return this.tick;
    }
}
