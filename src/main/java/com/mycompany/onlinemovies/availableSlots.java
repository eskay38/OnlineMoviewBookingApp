

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

import com.mycompany.onlinemovies.slots;
import javax.servlet.http.HttpSession;


@WebServlet(name = "availableSlots", urlPatterns = {"/availableSlots"})
public class availableSlots extends HttpServlet 
{

    
    public ArrayList<slots> slotlist;

    public availableSlots() throws SQLException 
    {
    	
        try 
        {
            
            this.slotlist = new ArrayList<>();
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            //String sql = "select * from shows where moviename=?";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,username,password);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from theatres");
            String tname,addr;
            String str1,str2,str3,str4;
            
            while(rs.next())
            {
                tname=rs.getString(1);
                tname = tname.toLowerCase();
                addr=rs.getString(3);
                Statement st1 = con.createStatement();
                String sql="select * from "+tname;
                
                ResultSet rs1 = st1.executeQuery(sql);
                     
                     while(rs1.next())
                     {
                        String s1,s2,s3,s4;
                     	s1=rs1.getString(3);
                     	s2=rs1.getString(4);
                     	s3=rs1.getString(5);
                     	s4=rs1.getString(6);


                        
                        if(s1.equalsIgnoreCase("Yes"))
                        {
                        	str1="9:00 am - 12:30 pm";
                        	this.slotlist.add(new slots(tname,rs1.getInt(1),rs1.getInt(2),str1,addr));
                        	
                        }
                        if(s2.equalsIgnoreCase("Yes"))
                        {
                        	str2="12:45 pm - 4:15 pm";
                        	this.slotlist.add(new slots(tname ,rs1.getInt(1),rs1.getInt(2),str2,addr));
                        	
                        }
                        if(s3.equalsIgnoreCase("Yes"))
                        {
                        	str3="4:30 pm - 8:00 pm";
                        	this.slotlist.add(new slots(tname , rs1.getInt(1),rs1.getInt(2),str3,addr));
                        	
                        }
                        if(s4.equalsIgnoreCase("Yes"))
                        {
                        	str4="8:15 pm - 11:45 pm";
                        	this.slotlist.add(new slots(tname , rs1.getInt(1), rs1.getInt(2),str4 ,addr));
                        	
                        }
                        
                        
                    }
            }
            con.close();
        } 
        catch (ClassNotFoundException ex) 
        {
            Logger.getLogger(moviedata.class.getName()).log(Level.SEVERE, null, ex);
        }
               
    }
    
    public ArrayList<slots> getFreeSlotList()
    {
        return this.slotlist;
    }
}

