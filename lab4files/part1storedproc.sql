DELIMITER @@
DROP PROCEDURE IF EXISTS increase_salary_proc @@
Create PROCEDURE increase_salary_proc
(IN inEmpID INT,
IN inPercentage DOUBLE(5,2),
OUT errorCode INT)

empLabel: BEGIN
    IF (inPercentage > 100.00 OR inPercentage < 0.00) THEN
    --DECLARE @emp_exists boolean =  ;
        SET errorCode = -1;
        LEAVE empLabel;
    Elseif not exists(select * from Employee where empID = inEmpID) then 
        SET errorCode = -2;
        LEAVE empLabel; 
    Else
        SET errorCode = 0;
        Update Employee 
        SET salary = salary + salary*inPercentage/100
        Where empID = inEmpID;
    End If;

    
END @@
DELIMITER ;
