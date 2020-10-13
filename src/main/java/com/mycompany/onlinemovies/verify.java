/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.onlinemovies;

//import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

/**
 *
 * @author IDBI
 */
@WebServlet("/verify")
public class verify extends HttpServlet {

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
        HttpSession session = request.getSession();
        session.removeAttribute("user_type");
        session.removeAttribute("name");
        session.removeAttribute("phone");
        session.removeAttribute("movie");
        session.removeAttribute("uid");
        
         String url = "jdbc:mysql://localhost:3306/data1";
           String username = "root";
           String password = "root";
           String next = (String) request.getParameter("next");
           String un = (String) request.getParameter("utype");
           if(un.equals("Guest"))
           {
                session.setAttribute("user_type",un);
                response.sendRedirect(request.getContextPath()+"/welcome.jsp");
           }
           else
           {
             try {
                 String sql = "select * from "+un;
                 String e = request.getParameter("email");
                 String pw = request.getParameter("pword");
                 
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con = DriverManager.getConnection(url,username,password);
                 Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery(sql);
                 int i=0;
                 int flag=0;
                 if(rs.next())
                 {
                     
                     do{
                         
                         if(rs.getString(2).equals(e)||rs.getString(3).equals(e))
                         {
                             if(rs.getString(4).equals(pw)){
                                 
                                 String rn= rs.getString(1);
                                 flag=1;
                                 session.setAttribute("name",rn);
                                 session.setAttribute("phone",rs.getString(3));
                                 if(un.equalsIgnoreCase("admin"))
                                 {
                                    session.setAttribute("user_type","ADMIN");
                                    if(next==null)
                                    {
                                        response.sendRedirect(request.getContextPath()+"/adminhome.jsp");
                                    }
                                    else
                                    {
                                        response.sendRedirect(request.getContextPath()+"/"+next);
                                    }
                                 }
                                 else
                                 {
                                    session.setAttribute("user_type","USER");
                                    if(next==null || next.equals("register.jsp") || next.equals("bookings.jsp") || next.equals("manageShow.jsp") || next.equalsIgnoreCase("addMovie.jsp") || next.equalsIgnoreCase("adminHome.jsp"))
                                    {
                                        response.sendRedirect(request.getContextPath()+"/welcome.jsp");
                                    }
                                    else
                                    {
                                        response.sendRedirect(request.getContextPath()+"/"+next);
                                    }
                                 }

                             }
                             else{
                                 //JOptionPane.showMessageDialog(null,"Wrong Password");
                                 
                                 response.sendRedirect("login.jsp");
                             }
                             flag=1;
                         }
                     }while(rs.next()&&flag==0);
                 }
                 if(flag==0){
                     
                     //JOptionPane.showMessageDialog(null,"Wrong Username");
                     
                     response.sendRedirect("login.jsp");
                 } } catch (ClassNotFoundException ex) {
                 Logger.getLogger(verify.class.getName()).log(Level.SEVERE, null, ex);
             } catch (SQLException ex) {
                 Logger.getLogger(verify.class.getName()).log(Level.SEVERE, null, ex);
             }
        }
    }

}
