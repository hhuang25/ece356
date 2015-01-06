<%-- 
    Document   : user_data_form
    Created on : 6-Jan-2015, 1:44:29 PM
    Author     : h53huang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page 2</title>
    </head>
    <body>
        
        <h1>User data form</h1>
        <form method="post" action="UserDataServlet">
            what is your name: <input type="text" name="username" value=""/>
            <br>
            what is your favourite colour: 
            <select name="usercolour">
                <option>red</option>
                <option>green</option>
                <option>blue</option>
            </select>
            <br>
            <input type="submit" value="Submit Query" />
        </form>
    </body>
    
</html>
