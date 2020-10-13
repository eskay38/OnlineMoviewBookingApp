/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.onlinemovies;

/**
 *
 * @author Lenovo
 */
public class show 
{
    private int id ;
    private String movie_name ;
    private String theatre_name ;
    private int screen ;
    private String start_time ;
    private String end_time ;
    private int gold,prime,classic ;
    private String address;
    
    public show()
    {
        
    }
    
    public show(int a,String b,String c,int d,String e,String f,String g,int h,int i,int j)
    {
        this.id =a;
        this.movie_name =b;
        this.theatre_name =c;
        this.screen =d;
        this.start_time =e;
        this.end_time =f;
        this.address = g;
        this.gold =h;
        this.prime=i;
        this.classic = j;
        
    }
    
    public int getShowId()
    {
        return this.id;
    }
    
    public String getShowMovie()
    {
        return this.movie_name;
    }
    
    public String getShowTheatre()
    {
        return this.theatre_name;
    }
    
    public int getShowScreen()
    {
        return this.screen;
    }
    
    public String getShowStartTime()
    {
        return this.start_time;
    }
    
    public String getShowEndTime()
    {
        return this.end_time;
    }
    
    public int getGoldSeats()
    {
        return this.gold;
    }
    
    public int getPrimeSeats()
    {
        return this.prime;
    }
    
    public int getClassicSeats()
    {
        return this.classic;
    }
    
    public int getShowAvailableSeats()
    {
        return (this.gold+this.prime+this.classic);
    }
    
    public String getShowAddress()
    {
        return this.address;
    }
}
