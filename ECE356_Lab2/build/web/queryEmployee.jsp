<%-- 
    Document   : queryEmployee
    Created on : 20-Jan-2015, 3:13:25 PM
    Author     : h53huang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="QueryServlet">
            <input type ="hidden" name ="qnum" value="3">
            <div>
                Enter selection criteria: <br>
                Employee ID: <input type="number" name="empID" id="empID"><br>
                Employee name: <input type="text" name="empName" id="empName"><br>
                Job: <input type="text" name="job" id="job"><br>
                Dept ID: <input type="number" name="deptID" id="deptID"><br>
                Salary: <input type="number" name="salary" id="salary"><br>
                <input type="submit" value="Submit Query">
            </div>
        </form>
    </body>
</html>
