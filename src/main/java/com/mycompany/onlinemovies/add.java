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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "add", urlPatterns = {"/add"})
public class add extends HttpServlet {

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
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
        }
           Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/data1","root","root");
        } catch (SQLException ex) {
            Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
        }
            
           String na=request.getParameter("name");
           String pn = request.getParameter("phno");
           String e = request.getParameter("email");
           String pw = request.getParameter("pword");
           
           String sq = "select Email_ID from registered where Email_ID= ? ";
           PreparedStatement stl=null;
        try {
            stl = con.prepareStatement(sq);
        } catch (SQLException ex) {
            Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            stl.setString(1, e);
        } catch (SQLException ex) {
            Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
        }
           ResultSet rs = null;
        try {
            rs = stl.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
        }
        try 
        {
            if(rs.next())
            {
                response.sendRedirect("register.jsp?msg=Email already exists");
            }
            else
            {
                String sql = "INSERT INTO registered(Name,EMail_ID,PhoneNo,Password)"+ "VALUES(?,?,?,?)";
                    PreparedStatement st = null;
                 try {
                     st = con.prepareStatement(sql);
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 try {
                     st.setString(1, na);
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 try {
                     st.setString(2, e);
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 try {
                     st.setString(3, pn);
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 try {
                     st.setString(4, pw);
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }
                 try {
                     st.executeUpdate();
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }

                 try {
                     con.close();
                 } catch (SQLException ex) {
                     Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
                 }

                    response.sendRedirect("login.jsp");
            }
        } 
        catch (SQLException ex) {
            Logger.getLogger(add.class.getName()).log(Level.SEVERE, null, ex);
        }
               
           
    }

}
