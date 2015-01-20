<%-- 
    Document   : index
    Created on : 11-Jan-2013, 9:14:06 AM
    Author     : Wojciech Golab
--%>

<%@page import="ece356.Queuery2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ece356.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 2</title>
    </head>

    <%! ArrayList<Employee> employeeList;%>
    <% employeeList = (ArrayList<Employee>) request.getAttribute("employeeList");%>
    <%! ArrayList<Queuery2> Queuery2List;%>
    <% Queuery2List = (ArrayList<Queuery2>) request.getAttribute("Queuery2List");%>

    <body>
        <h1>Success!</h1>
        <%
            if (employeeList != null) {
                out.println("<h1>Employee Data</h1>");
                out.println("<table border=1>");
                out.println("<tr><th>empID</th><th>empName</th><th>job</th><th>deptID</th><th>salary</th></tr>");
                for (Employee em : employeeList) {
                    out.println("<tr><td>");
                    out.print(em.getEmpID());
                    out.print("</td><td>");
                    out.print(em.getEmpName());
                    out.print("</td><td>");
                    out.print(em.getJob());
                    out.print("</td><td>");
                    out.print(em.getDeptID());
                    out.print("</td><td>");
                    out.print(em.getSalary());
                    out.println("</td></tr>");
                }
                out.println("</table>");
            }
            
           else if (Queuery2List != null) {
                out.println("<h1>Queuery2 Data</h1>");
                out.println("<table border=1>");
                out.println("<tr><th>empName</th><th>DeptLocation</th></tr>");
                for (Queuery2 q2 : Queuery2List) {
                    out.println("<tr><td>");
                    out.print(q2.getEmpName());
                    out.print("</td><td>");
                    out.print(q2.getDeptLocation());
                    out.println("</td></tr>");
                }
                out.println("</table>");
            }
        %>
        <p>
        <a href="index.jsp">return to main page</a>
    </body>
</html>
