<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%
    if (session.getAttribute("currentUser") == null) {
        out.println("<script>window.location.href='" + session.getServletContext().getContextPath() + "/views/login.jsp';</script>");
    }
%>
