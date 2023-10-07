package com.murali.adminlogin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StaffLogin
 */
@WebServlet("/StaffLogin")
public class StaffLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String mail=request.getParameter("mail");
		 String pass=request.getParameter("pass");
		RequestDispatcher dispatcher=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/teacherdb","root","murali");
			PreparedStatement pst=con.prepareStatement("select * from details where mail=? and password=?");
			pst.setString(1, mail);
			pst.setString(2, pass);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				dispatcher = request.getRequestDispatcher("cgpa-fill.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("staff-login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}