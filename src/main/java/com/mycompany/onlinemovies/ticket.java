/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.onlinemovies;

/**
 *
 * @author IDBI
 */
public class ticket 
{
    public String ID;
    public String movie_name;
    public String user_name;
    public String phone_no;
    public String rating;
    public String duration;
    public String show_time;
    public String screen;
    public String image;
    public String theatre;
    public String address;
    public String seats;
    public String category;
    public String price;
    
    public ticket(){
        
    }
    
    public ticket(String a,String b,String c,String d,String e,String f,String g,String h,String i,String j,String k,String l,String m,String n){
        this.ID=a;
        this.movie_name=b;
        this.user_name=c;
        this.phone_no=d;
        this.rating=e;
        this.duration=f;
        this.show_time=g;
        this.screen=h;
        this.image=i;
        this.theatre=j;
        this.address=k;
        this.seats=l;
        this.category=m;
        this.price=n;
    }
    
    public String getUserName()
    {
        return this.user_name;
    }
    public String getMovieName()
    {
        return this.movie_name;
    }
    public String getPhone()
    {
        return this.phone_no;
    }
    public String getTheatre()
    {
        return this.theatre;
    }
    public String getScreen()
    {
        return this.screen;
    }
    public String getShowTime()
    {
        return this.show_time;
    }
    public String getCategory()
    {
        return this.category;
    }
    public String getSeats()
    {
        return this.seats;
    }
    public String getPrice()
    {
        return this.price;
    }
    
}
