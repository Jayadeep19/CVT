USE employee_salary;

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
id  INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
employee_id  INT,
employee_name  varchar(50),
salary  double
);

INSERT INTO salaries (employee_id, employee_name, salary)
VALUES (1, (SELECT Name_ FROM employee WHERE id = 1),
			(SELECT Received_salary FROM employee WHERE id = 1)),
		(2, (SELECT Name_ FROM employee WHERE id = 2),
			(SELECT Received_salary FROM employee WHERE id = 2)),
		(3, (SELECT Name_ FROM employee WHERE id = 3),
			(SELECT Received_salary FROM employee WHERE id = 3)),
		(4, (SELECT Name_ FROM employee WHERE id = 4),
			(SELECT Received_salary FROM employee WHERE id = 4)),
		(5, (SELECT Name_ FROM employee WHERE id = 5),
			(SELECT Received_salary FROM employee WHERE id = 5)),
		(6, (SELECT Name_ FROM employee WHERE id = 6),
			(SELECT Received_salary FROM employee WHERE id = 6)),
		(7, (SELECT Name_ FROM employee WHERE id = 7),
			(SELECT Received_salary FROM employee WHERE id = 7)),
		(8, (SELECT Name_ FROM employee WHERE id = 8),
			(SELECT Received_salary FROM employee WHERE id = 8));