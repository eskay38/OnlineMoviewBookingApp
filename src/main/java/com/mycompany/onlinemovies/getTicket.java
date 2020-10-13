/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.onlinemovies;

import com.mycompany.onlinemovies.ticket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author IDBI
 */
public class getTicket {
    public ticket tickets;
    
    public getTicket()
    {
        
    }

    public getTicket(String id) throws SQLException 
    {
        try 
        {
            
            
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            String sql = "select * from ticketbooked where ID="+id;
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next())
            {
                     
                     do
                     {
                        this.tickets = new ticket(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14));
                  
                    }while(rs.next());
                 }
            con.close();
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
            this.tickets=null;
        }
               
    }
    
    public ticket retTickets()
    {
        return this.tickets;
    }
}
