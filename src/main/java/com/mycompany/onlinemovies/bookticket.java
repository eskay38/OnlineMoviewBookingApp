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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author IDBI
 */
@WebServlet(name = "bookticket", urlPatterns = {"/bookticket"})
public class bookticket extends HttpServlet {
    
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        try 
        {
            String url = "jdbc:mysql://localhost:3306/data1";
            String username = "root";
            String password = "root";
            HttpSession session = request.getSession();
            int id;
            int no = Integer.parseInt(request.getParameter("seats"));
            int price = Integer.parseInt(request.getParameter("price"));
            String idSt = (String) session.getAttribute("uid");
            if(idSt==null || idSt.equals(""))
            {
                response.sendRedirect("welcome.jsp");
            }
            else if( no==0 && price==0)
            {
                response.sendRedirect(request.getContextPath()+"/seatbook2.jsp?showid="+idSt);
            }
            else
            {
                id = Integer.parseInt(idSt);
                String cat = request.getParameter("category");
                 no = Integer.parseInt(request.getParameter("seats"));
                 price = Integer.parseInt(request.getParameter("price"));
                String sql = "select "+cat+" from shows where ID="+id;
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(url,username,password);
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(sql);
                    if(!rs.next())
                    {
                        response.sendRedirect(request.getContextPath()+"/welcome.jsp");
                    }
                    int v = rs.getInt(1);
                    v = v - no;
                    String sql2 = "update shows set "+cat+"="+v+" where ID="+id;
                    PreparedStatement st2 = null;
                    st2 = con.prepareStatement(sql2);
                    st2.executeUpdate();
                    String sql3 = "select * from shows where ID="+id;
                    Statement st3 = con.createStatement();
                    ResultSet rs3  = st3.executeQuery(sql3);
                    if(!rs3.next())
                    {
                        response.sendRedirect(request.getContextPath()+"/welcome.jsp");
                    }
                    String mn = rs3.getString(2);
    //                String sql4 = "select * from movies_db where movie_name="+mn;
                    PreparedStatement st4 = con.prepareStatement("select * from movies_db where movie_name=?");
                    st4.setString(1,mn);
                    ResultSet rs4  = st4.executeQuery();
                    if(!rs4.next())
                    {
                        response.sendRedirect(request.getContextPath()+"/welcome.jsp");
                    }


                    String uname = (String)session.getAttribute("name");
                    String pno = (String)session.getAttribute("phone");
                    String rat = rs4.getString(3);
                    String dur = rs4.getString(5);
                    String tim = rs3.getString(5);
                    String sc = rs3.getString(4);
                    String img = rs4.getString(10);
                    String the = rs3.getString(3);
                    String adr = rs3.getString(10);

    //                String sql6;
    //                sql6 = "insert into ticketbooked(movie_name,user_name,phone_no,rating,duration,show_time,screen,image,theatre,address,seats,category,price) values("+uname+","+pno+","+rat+","+dur+","+tim+","+sc+","+img+","+the+","+adr+","+String.valueOf(no)+","+cat+","+String.valueOf(price)+")";
                    PreparedStatement st6 = null;
                    st6  = con.prepareStatement("insert into ticketbooked(movie_name,user_name,phone_no,rating,duration,show_time,screen,image,theatre,address,seats,category,price) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    st6.setString(1,mn);
                    st6.setString(2,uname);
                    st6.setString(3,pno);
                    st6.setString(4,rat);
                    st6.setString(5,dur);
                    st6.setString(6,tim);
                    st6.setString(7,sc);
                    st6.setString(8,img);
                    st6.setString(9,the);
                    st6.setString(10,adr);
                    st6.setString(11,String.valueOf(no));
                    st6.setString(12,cat);
                    st6.setString(13,String.valueOf(price));
                    st6.executeUpdate();

                    String sql5 = "SELECT MAX(ID)  FROM ticketbooked";
                    Statement st5 = con.createStatement();
                    ResultSet rs5  = st5.executeQuery(sql5);
                    if(!rs5.next())
                    {
                        response.sendRedirect(request.getContextPath()+"/welcome.jsp");
                    }
                    String tid = String.valueOf(rs5.getInt(1));
                    
                    session.removeAttribute("uid");
                    session.removeAttribute("movie");
                    response.sendRedirect(request.getContextPath()+"/finalticket.jsp?tid="+tid);
            }
                
            
        } 
        catch (ClassNotFoundException | SQLException ex) 
        {
            Logger.getLogger(bookticket.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath()+"/welcome.jsp");
        }
    }

    

}
