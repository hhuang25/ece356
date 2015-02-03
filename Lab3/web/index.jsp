<%-- 
    Document   : index
    Created on : 11-Jan-2013, 9:14:06 AM
    Author     : Wojciech Golab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 2</title>
    </head>
    <body>
        <h1>Please select one of the following:</h1>
        <ul>
        <li><a href="QueryServlet?qnum=1">List all employees</a></li>        
        <li><a href="QueryServlet?qnum=2">List all departments</a></li>        
        <li><a href="queryEmployee.jsp">Query employees</a></li>        
        <li><a href="AddEmployeeServlet">Add employee</a></li>
        <li><a href="DeleteEmployeeServlet">Delete employee</a></li>
        </ul>
    </body>
</html>
