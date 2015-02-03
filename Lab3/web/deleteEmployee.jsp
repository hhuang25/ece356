<%-- 
    Document   : deleteEmployee
    Created on : 3-Feb-2015, 2:44:48 PM
    Author     : h53huang
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ece356.Department"%>
<%@page import="ece356.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Employee</title>
    </head>
        
    <body>
        <h1>Delete Employee</h1>
        
        <form method="post" action="DeleteEmployeeServlet">
            <select name ="EmployeeID">
                    <%! ArrayList<Employee> employeeList;%>
                    <%
                        employeeList = (ArrayList<Employee>) request.getAttribute("employeeList");
                        for (Employee emp : employeeList)  {
                    %>
                    <option value="<%= emp.getEmpID()%>"><%= emp.getEmpName()%></option>
                    <%
                        }
                    %>
                </select><br/>
                <input type="submit" value="Submit">
        </form>
    </body>
</html>
