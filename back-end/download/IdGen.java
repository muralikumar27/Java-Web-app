package com.murali.download;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/IdGen")
@MultipartConfig
public class IdGen extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	RequestDispatcher dispatcher=null;
    	String id=request.getParameter("id");
		String name=request.getParameter("name");
		String dept=request.getParameter("dept");
		String designation=request.getParameter("designation");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
    	//String name=request.getParameter("name");
    	String action=request.getParameter("operation");
    	if(action.equals("insert")) {
        Part file=request.getPart("photo");
        String imageFileName=file.getSubmittedFileName();//Gets the file name specified by the client
        
        String uploadPath="E:/JAVA ECLIPSE/projectPdf/"+imageFileName;
        FileOutputStream fout = null;
        InputStream is = null;
        // store an image in server system's file
        try {
            fout = new FileOutputStream(uploadPath);
            is = file.getInputStream();
            
            byte[] buffer = new byte[8192]; 
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fout.write(buffer, 0, bytesRead);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            try {
                if (fout != null) {
                    fout.close();
                }
                if (is != null) {
                    is.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
		
		try {
        Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/idcard","root","murali");
		PreparedStatement pst=con.prepareStatement("insert into details (name,id,dept,designation,dob,filename,address)values(?,?,?,?,?,?,?) ");
		pst.setString(1, name);
		pst.setString(2, id);
		pst.setString(3, dept);
		pst.setString(4, designation);
		pst.setString(5, dob);
		pst.setString(6,imageFileName );
		pst.setString(7,address);
		int rowCount=pst.executeUpdate();
		if(rowCount>0) {
			 request.setAttribute("status", "success");
			 dispatcher=request.getRequestDispatcher("id-gen.jsp");
		}
		else {
			request.setAttribute("status", "failed");
			dispatcher=request.getRequestDispatcher("id-gen.jsp");
		}
		dispatcher.forward(request, response);
	}
	catch(SQLIntegrityConstraintViolationException sqle) {
		request.setAttribute("status", "exist");
    	dispatcher = request.getRequestDispatcher("id-gen.jsp");
    	dispatcher.forward(request, response);
	}
	catch(Exception e) {
		request.setAttribute("status", "failed");
    	dispatcher = request.getRequestDispatcher("id-gen.jsp");
    	dispatcher.forward(request, response);
        e.printStackTrace();
		e.printStackTrace();
	}
		//saving as PDF file
		try {
        String fileName="E:\\JAVA ECLIPSE\\projectPdf\\"+name+".pdf"; //saving with the person's name
        Document doc=new Document();
        PdfWriter.getInstance(doc, new FileOutputStream(fileName));
        doc.open();
        Image image = Image.getInstance("E:\\JAVA ECLIPSE\\projectPdf\\" + imageFileName);
        
        //adding the image
        float maxWidth = 75; 
        float maxHeight = 75; 
        image.scaleToFit(maxWidth, maxHeight);
        //adding the details as text
        Font font = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLUE);
        doc.add(image);
        Paragraph para = new Paragraph();
        para.add(new Chunk("Name : ", font));
        para.add(new Chunk(name + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK)));
        para.add(new Chunk("ID : ", font));
        para.add(new Chunk(id + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK)));
        para.add(new Chunk("Designation : ", font));
        para.add(new Chunk(designation + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK)));
        para.add(new Chunk("DOB : ", font));
        para.add(new Chunk(dob + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK)));
        para.add(new Chunk("Address : ", font));
        para.add(new Chunk(address + "\n", FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK)));
        
        doc.add(para);
        doc.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
    }
    	else if(action.equals("delete")) {
    		try {
		        String query = "DELETE FROM details WHERE id=?";
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/idcard", "root", "murali");
		        PreparedStatement pst = con.prepareStatement(query);
		        pst.setString(1, id);
		        int row = pst.executeUpdate();
		        
		        if (row > 0) {
		            request.setAttribute("status", "success");
		        } else {
		            request.setAttribute("status", "doesnotexist");
		        }
		        
		        dispatcher = request.getRequestDispatcher("id-gen.jsp");
		        dispatcher.forward(request, response);
		    } 
		    
		    catch (Exception e) {
		    	request.setAttribute("status", "failed");
		    	dispatcher = request.getRequestDispatcher("id-gen.jsp");
		    	dispatcher.forward(request, response);
		        e.printStackTrace();
		    }
    	}
    	else if(action.equals("download")) {
    		String pdfname=null;
    		try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/idcard","root","murali");
    		PreparedStatement pst = con.prepareStatement("select * from details where id=?");
            pst.setString(1, id);
            ResultSet rs = pst.executeQuery();
            //name will be retrieved using id number and downloading file will be named after the person's name
            if (rs.next()) {
                
               pdfname = rs.getString("name");
               }
            else {
    			System.out.print("nothing found");
    		}
    		}
    		
    		catch(Exception e) {
    			e.printStackTrace();
    		}
    		
			String filePath = "E:\\JAVA ECLIPSE\\projectPdf\\"+pdfname+".pdf";

            File downloadFile=new File(filePath);
            FileInputStream inStream=new FileInputStream(downloadFile);
            
            String relativePath=getServletContext().getRealPath("");
            ServletContext context=getServletContext();
            String mimeType=context.getMimeType(filePath);
            if(mimeType == null) {
            	mimeType="application/octet-stream";
            	
            }
            response.setContentType(mimeType);
            response.setContentLength((int) downloadFile.length());
            
            String headerKey = "Content-Disposition";
            String headerValue= String.format("attachment: filename=\"%s\"",downloadFile.getName());
            response.setHeader(headerKey, headerValue);
            
            OutputStream out=response.getOutputStream();
            byte[] buffer=new byte[4096];
            int bytesRead=-1;
            while((bytesRead=inStream.read(buffer)) != -1) {
            	out.write(buffer,0,bytesRead);
            }
            inStream.close();
            out.close();
    	}
    }
    
	
}