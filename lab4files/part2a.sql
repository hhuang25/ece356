USE ece356db_xxxxx;


/* Create store procedure 

/* Example 1: No output parameters */

                                                                                                */
/* Note: we temporarily change the myql delimiter to $ ( instead of ;)                          */
/* so that we can use ; for the end of each statement but $ for the end of the stored procedure */

DELIMITER $

DROP PROCEDURE IF EXISTS emp_count_1;


CREATE PROCEDURE emp_count_1()
BEGIN
 SELECT COUNT(*) FROM Employee;
END
$
DELIMITER ;


/* To invoke this procedure use the mysql command statement
   CALL emp_count;
*/







/* Example 2: Output parameters */


DELIMITER $

DROP PROCEDURE IF EXISTS emp_count_2;

CREATE PROCEDURE emp_count_2(OUT param1 INT)
BEGIN
 SELECT COUNT(*) INTO param1 FROM Employee;
END
$
DELIMITER ;


/* To invoke this procedure use the mysql command statement
   CALL emp_count_2(@empCount);
   SELECT @empCount; 
*/










