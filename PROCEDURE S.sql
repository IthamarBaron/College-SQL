-- ithamar baron
-- 1
ALTER TABLE Employees ADD cumulative_salary DECIMAL(10,2);

-- 2
DELIMITER $$

CREATE PROCEDURE salary_cumulative_calculate()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_salary DECIMAL(10,2);
    DECLARE cumulative DECIMAL(10,2);
    
    DECLARE emp_cursor CURSOR FOR 
        SELECT EmployeeID, Salary FROM Employees ORDER BY EmployeeID;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN emp_cursor;

    SET cumulative = 0;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET cumulative = cumulative + emp_salary;

        UPDATE Employees
        SET cumulative_salary = cumulative
        WHERE EmployeeID = emp_id;
    END LOOP;

    CLOSE emp_cursor;
END $$

DELIMITER ;


-- 3
DELIMITER $$

CREATE PROCEDURE hierarchy_process()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_id INT;
    DECLARE emp_salary DECIMAL(10,2);
    DECLARE bonus DECIMAL(10,2);

    DECLARE emp_cursor CURSOR FOR 
        SELECT EmployeeID, Salary FROM Employees;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET bonus = emp_salary * 0.05;

        UPDATE Employees 
        SET Salary = Salary + bonus 
        WHERE EmployeeID = emp_id;

        UPDATE Employees 
        SET Salary = Salary + bonus 
        WHERE ReportsTo = emp_id;
    END LOOP;

    CLOSE emp_cursor;
END $$

DELIMITER ;


CALL salary_cumulative_calculate();
CALL hierarchy_process();
