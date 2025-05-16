<%-- 
    Document   : dologout
    Created on : May 16, 2025, 1:55:41?PM
    Author     : Marsha Nabila L
--%>

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
