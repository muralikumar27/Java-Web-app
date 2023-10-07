package com.murali.adminlogin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.xhtmlrenderer.pdf.*;
import org.apache.catalina.connector.Response;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;



/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String pass = request.getParameter("pass");
        RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "murali");
            PreparedStatement pst = con.prepareStatement("select * from details where mail=? and password=?");
            pst.setString(1, mail);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                
                String name = rs.getString("name");
                String id = rs.getString("id");
                String department = rs.getString("dept");
                float cgpa = rs.getFloat("cgpa");

                
                request.setAttribute("name", name);
                request.setAttribute("id", id);
                request.setAttribute("department", department);
                request.setAttribute("cgpa", cgpa);

                
                dispatcher = request.getRequestDispatcher("success.jsp");
                
                //saving as PDF file
                String fileName="E:\\JAVA ECLIPSE\\projectPdf\\test.pdf";
                Document doc=new Document();
                PdfWriter.getInstance(doc, new FileOutputStream(fileName));
                doc.open();
                Paragraph para=new Paragraph("Name : "+name+"\nID : "+id+"\nDepartment : "+department+"\nCGPA : "+cgpa);
                doc.add(para);
                doc.close();
                
            } else {
            	request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("student-login.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}