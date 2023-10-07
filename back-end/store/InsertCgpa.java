package com.murali.store;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertCgpa
 */
@WebServlet("/InsertCgpa")
public class InsertCgpa extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("uniqueid");
		String cgpa=request.getParameter("cgpa");
		
		
		RequestDispatcher dispatcher=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","murali");
			PreparedStatement pst=con.prepareStatement("UPDATE details SET cgpa = ? WHERE id = ?");
			pst.setFloat(1, Float.parseFloat(cgpa));
			pst.setString(2, id);
			int rows=pst.executeUpdate();
			if(rows>0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("cgpa-fill.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("cgpa-fill.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			request.setAttribute("status", "failed");
			e.printStackTrace();
		}
	}
		
	

}
