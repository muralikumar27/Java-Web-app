package com.murali.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/DownloadDetails")
public class DownloadDetails extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String filePath = "E:\\JAVA ECLIPSE\\projectPdf\\test.pdf";

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
