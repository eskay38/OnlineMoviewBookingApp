
package com.mycompany.onlinemovies;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author IDBI
 */

public class slots  
{
    private String theatre_name;
    private int screen;
    private int total_seats;
    private String freeSlot;
    private String address;
    
    
    public slots()
    {
        
    }
    
    public slots(String a,int b, int c, String d,String e)
    {
        this.theatre_name=a;
        this.screen=b;
        this.total_seats=c;
        this.freeSlot=d;
        this.address=e;
    }
    
    public String getFreeSlotTheatre()
    {
        return this.theatre_name;
    }
    public int getFreeSlotScreen()
    {
        return this.screen;
    }
    
    public int getFreeSlotTotalSeats()
    {
        return this.total_seats;
    }
    
    public String getFreeSlot()
    {
        return this.freeSlot;
    }
    public String getFreeSlotAddress()
    {
        return this.address;
    }
       
 }
