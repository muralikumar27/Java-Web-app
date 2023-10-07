package com.murali.store;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddStudent
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("uniqueid");
		String name=request.getParameter("name");
		String dept=request.getParameter("dept");
		String mail=request.getParameter("mail");
		String password=request.getParameter("password");
		String action=request.getParameter("operation");
		RequestDispatcher dispatcher=null;
		if(action.equals("insert")) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","murali");
			PreparedStatement pst=con.prepareStatement("insert into details (id,name,dept,mail,password)values(?,?,?,?,?) ");
			pst.setString(1, id);
			pst.setString(2, name);
			pst.setString(3, dept);
			pst.setString(4, mail);
			pst.setString(5, password);
			int rowCount=pst.executeUpdate();
			if(rowCount>0) {
				 request.setAttribute("status", "success");
				 dispatcher=request.getRequestDispatcher("student-db.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("student-db.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(SQLIntegrityConstraintViolationException sqle) {
			request.setAttribute("status", "exist");
	    	dispatcher = request.getRequestDispatcher("student-db.jsp");
	    	dispatcher.forward(request, response);
		}
		catch(Exception e) {
			request.setAttribute("status", "failed");
	    	dispatcher = request.getRequestDispatcher("student-db.jsp");
	    	dispatcher.forward(request, response);
	        e.printStackTrace();
			e.printStackTrace();
		}
		}
		else if (action.equals("delete")) {
		    try {
		        String query = "DELETE FROM details WHERE id=?";
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "murali");
		        PreparedStatement pst = con.prepareStatement(query);
		        pst.setString(1, id);
		        int row = pst.executeUpdate();
		        
		        if (row > 0) {
		            request.setAttribute("status", "success");
		        } else {
		            request.setAttribute("status", "doesnotexist");
		        }
		        
		        dispatcher = request.getRequestDispatcher("student-db.jsp");
		        dispatcher.forward(request, response);
		    } 
		    
		    catch (Exception e) {
		    	request.setAttribute("status", "failed");
		    	dispatcher = request.getRequestDispatcher("student-db.jsp");
		    	dispatcher.forward(request, response);
		        e.printStackTrace();
		    }
		}
	}

}
