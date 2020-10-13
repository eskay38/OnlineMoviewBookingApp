/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

public class movies  
{
    private String movie_name;
    private String certification;
    private String rating;
    private String genre;
    private String duration;
    private String starcast;
    private String director;
    private String synopsis;
    private String language;
    private String image;
    private String trailer;
    
    public movies(){
        
    }
    
    public movies(String a, String b, String c, String d, String e, String f, String g, String h, String i, String j,String k)
    {
        this.movie_name=a;
        this.certification=b;
        this.rating=c;
        this.genre=d;
        this.duration=e;
        this.starcast=f;
        this.director=g;
        this.synopsis=h;
        this.language=i;
        this.image=j;
        this.trailer=k;
    }
    
    public String getMovieName(){
        return this.movie_name;
    }
    
    public String getCertification(){
        return this.certification;
    }
    
    public String getRating(){
        return this.rating;
    }
    
    public String getGenre(){
        return this.genre;
    }
    
    public String getDuration(){
        return this.duration;
    }
        
    public String getLanguage(){
        return this.language;
    }
    
    public String getImage(){
        return this.image;
    }
    
    public String getTrailer()
    {
        return this.trailer;
    }
}
