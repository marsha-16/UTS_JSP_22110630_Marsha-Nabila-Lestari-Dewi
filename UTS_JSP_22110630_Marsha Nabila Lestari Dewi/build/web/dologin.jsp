<%-- 
    Document   : dologin
    Created on : May 16, 2025, 1:54:09 PM
    Author     : Marsha Nabila L
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    if(username.equals("marsha") && password.equals("123")) {
        session.setAttribute("namauser", username);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
