package com.shuren.controller;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shuren.pojo.Project;
import com.shuren.pojo.ProjectReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

@Controller
@RequestMapping("/pdf")
public class PdfController {

	 @RequestMapping("/showPDF.action")
	    public String showPDF(String projectreplyid,HttpServletResponse response,Model model) {
		 System.out.println(projectreplyid);
		 ProjectReply p=new ProjectReply();
		 p.setProjectreplyid(projectreplyid);
		 model.addAttribute("projectreply",p);
		 return "projectPDF";
		 
	 }
	
    @RequestMapping("/displayPDF.action")
    public void displayPDF(HttpSession session,HttpServletResponse response) {
        try {
        	Project p=(Project) session.getAttribute("activeProject");
        	String id=p.getProjectid();
        	StringBuffer route=new StringBuffer();
        	route.append("E:/pdf/");
        	route.append(id);
        	route.append(".pdf");
            File file = new File(route.toString());
            FileInputStream fileInputStream = new FileInputStream(file);
            response.setHeader("Content-Disposition", "attachment;fileName=test.pdf");
            response.setContentType("multipart/form-data");
            OutputStream outputStream = response.getOutputStream();
            IOUtils.write(IOUtils.toByteArray(fileInputStream), outputStream);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }


    @RequestMapping("/displayPDFById.action")
    public void displayPDF(String projectreplyid,HttpSession session,HttpServletResponse response) {
        System.out.println(projectreplyid);
    	try {
        	StringBuffer route=new StringBuffer();
        	route.append("E:/pdf/");
        	route.append(projectreplyid);
        	route.append(".pdf");
            File file = new File(route.toString());
            FileInputStream fileInputStream = new FileInputStream(file);
            response.setHeader("Content-Disposition", "attachment;fileName=test.pdf");
            response.setContentType("multipart/form-data");
            OutputStream outputStream = response.getOutputStream();
            IOUtils.write(IOUtils.toByteArray(fileInputStream), outputStream);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}  
    