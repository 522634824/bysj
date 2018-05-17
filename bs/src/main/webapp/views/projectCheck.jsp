<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%
    if (session.getAttribute("activeProject") == null) {
        out.println("<script>window.location.href='" + session.getServletContext().getContextPath() + "/views/error.jsp';</script>");
    }
%>
