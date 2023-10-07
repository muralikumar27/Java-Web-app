package com.murali.adminlogin;

import java.io.*;

import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail=request.getParameter("email");
		String pass=request.getParameter("password");
		RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admindb","root","murali");
			PreparedStatement pst=con.prepareStatement("select * from admindetails where mail=? and pass=?");
			pst.setString(1, mail);
			pst.setString(2, pass);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("dash-board.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("admin-login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
