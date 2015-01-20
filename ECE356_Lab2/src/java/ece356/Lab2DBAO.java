package ece356;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Wojciech Golab
 */
public class Lab2DBAO {

    public static final String url = "jdbc:mysql://eceweb.uwaterloo.ca:3306/";
    public static final String user = "user_h53huang";
    public static final String pwd = "password";

    public static void testConnection()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        try {
            con = getConnection();
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }

    public static Connection getConnection()
            throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pwd);
        Statement stmt = null;
        try {
            con.createStatement();
            stmt = con.createStatement();
            stmt.execute("USE ece356db_h53huang;");
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
        return con;
    }

    public static void createSchema()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stmt = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            stmt.execute(
                    "DROP TABLE IF EXISTS Department; ");
            stmt.execute(
                    "CREATE TABLE Department("
                    + "deptID INT,"
                    + "deptName VARCHAR(100),"
                    + "location VARCHAR(100)"
                    + ");");
            stmt.execute(
                    "DROP TABLE IF EXISTS Employee; ");
            stmt.execute(
                    "CREATE TABLE Employee("
                    + "empID INT,"
                    + "empName VARCHAR(100),"
                    + "job VARCHAR(100),"
                    + "deptID INT,"
                    + "salary INT"
                    + ");");
            stmt.execute(
                    "DROP TABLE IF EXISTS Assigned; ");
            stmt.execute(
                    "CREATE TABLE Assigned("
                    + "empID INT,"
                    + "projID INT,"
                    + "role VARCHAR(100)"
                    + ");");
            stmt.execute(
                    "DROP TABLE IF EXISTS Project; ");
            stmt.execute(
                    "CREATE TABLE Project("
                    + "projID INT,"
                    + "title VARCHAR(100),"
                    + "budget INT,"
                    + "funds INT"
                    + ");");
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public static void populateDB()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stmt = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            // Department table
            stmt.execute(
                    "INSERT INTO Department(deptID, deptName, location) VALUES(3, 'marketing', 'Waterloo');");
            stmt.execute(
                    "INSERT INTO Department(deptID, deptName, location) VALUES(7, 'research', 'Guelph');");
            stmt.execute(
                    "INSERT INTO Department(deptID, deptName, location) VALUES(12, 'software', 'Toronto');");
            stmt.execute(
                    "INSERT INTO Department(deptID, deptName, location) VALUES(13, 'computing', 'Toronto');");
            // Employee table
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(23, 'Smith', 'programmer', 12, 35000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(45, 'Kelly', 'engineer', 7, 37000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(56, 'Herr', 'janitor', 7, 26000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(89, 'Williams', 'analyst', 12, 36000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(77, 'Hergot', 'secretary', 7, 28000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(66, 'Hess', 'technician', 7, 32000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(92, 'Mays', 'engineer', 7, 45000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(68, 'Morris', 'secretary', 3, 23000);");
            stmt.execute(
                    "INSERT INTO Employee(empID, empName, job, deptID, salary) VALUES(69, 'Maria', 'engineer', 3, 32000);");
            // Assigned table
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(23, 345, 'programmer');");
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(23, 123, 'programmer');");
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(66, 123, 'programmer');");
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(77, 123, 'secretary');");
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(45, 123, 'manager');");
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(89, 345, 'manager');");
            stmt.execute(
                    "INSERT INTO Assigned(empID, projID, role) VALUES(92, 123, 'engineer');");
            // Project table
            stmt.execute(
                    "INSERT INTO Project(projID, title, budget, funds) VALUES(345, 'compiler', 500000, 250000);");
            stmt.execute(
                    "INSERT INTO Project(projID, title, budget, funds) VALUES(123, 'display', 650000, 370000);");
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public static ArrayList<Employee> query1()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stmt = null;
        ArrayList<Employee> ret = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery(
                    "SELECT * FROM Employee WHERE job = 'engineer' AND salary >= 10000;");
            ret = new ArrayList<Employee>();
            while (resultSet.next()) {
                Employee e = new Employee(
                        resultSet.getInt("empID"),
                        resultSet.getString("empName"),
                        resultSet.getString("job"),
                        resultSet.getInt("deptID"),
                        resultSet.getInt("salary"));
                ret.add(e);
            }
            return ret;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public static ArrayList<Queuery2> query2()
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stmt = null;
        ArrayList<Queuery2> ret = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery(
                    "select Employee.empName, Department.location from Employee natural join Department;");
            ret = new ArrayList<Queuery2>();
            while (resultSet.next()) {
                Queuery2 q2 = new Queuery2(
                        resultSet.getString("empName"),
                        resultSet.getString("location"));
                ret.add(q2);
            }
            return ret;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public static boolean isNumeric(String str)
    {
      return str.matches("\\d+(\\.\\d+)?");  //match a number with optional decimal.
    }
    public static ArrayList<Employee> query3(String empID, String empName, 
            String job, String deptID, String salary)
            throws ClassNotFoundException, SQLException {
        Connection con = null;
        Statement stmt = null;
        
        ArrayList<Employee> ret = null;
        try {
            con = getConnection();
            stmt = con.createStatement();
            StringBuilder query = new StringBuilder("select * from Employee where ");
            int totalParams = 0;
            String and = "";
            PreparedStatement pStmt = con.prepareStatement("");
            
            if(!empID.equals("") && isNumeric(empID)){
                query.append(and).append(" empID = ?");
                and = " and";
            }
            if(!empName.equals("")){
                query.append(and).append(" empName = ?");
                and = " and";
            }
            if(!job.equals("")){
                query.append(and).append(" job = ?");
                and = " and";
            }
            if(!deptID.equals("") && isNumeric(deptID)){
                query.append(and).append(" deptID = ?");
                and = " and";
            }
            if(!salary.equals("") && isNumeric(salary)){
                query.append(and).append(" salary = ?");
            }
            //
            pStmt = con.prepareStatement(query.toString());
            if(!empID.equals("") && isNumeric(empID)){
                totalParams++;
                pStmt.setInt(totalParams, Integer.parseInt(empID));
            }
            if(!empName.equals("")){
                totalParams++;
                pStmt.setString(totalParams, empName);
            }
            if(!job.equals("")){
                totalParams++;
                pStmt.setString(totalParams, job);
            }
            if(!deptID.equals("") && isNumeric(deptID)){
                totalParams++;
           
                pStmt.setInt(totalParams, Integer.parseInt(deptID));
            }
            if(!salary.equals("") && isNumeric(salary)){
                totalParams++;
                pStmt.setInt(totalParams, Integer.parseInt(salary));
            }
            //
            if(and.equals("")){
                pStmt = con.prepareStatement("select * from Employee");
            }
            ResultSet resultSet = pStmt.executeQuery();
            ret = new ArrayList<Employee>();
            while (resultSet.next()) {
                Employee q3 = new Employee(
                        resultSet.getInt("empID"),
                        resultSet.getString("empName"),
                        resultSet.getString("job"),
                        resultSet.getInt("deptID"),
                        resultSet.getInt("salary"));
                ret.add(q3);
            }
            return ret;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}