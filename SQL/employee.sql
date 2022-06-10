-- DROP DATABASE employee_salary;
CREATE DATABASE employee_salary;
USE employee_salary;

CREATE TABLE employee (
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		Name_  VARCHAR(50) NOT NULL,
        Adress Varchar(55) NOT null,
        Designation double not null,
        Phone int,
        DOB date,
        Absents int,
        Salary double not null,
        Tax int,
        Received_salary double not null
);
INSERT INTO employee(Name_, Adress,Designation,Phone,DOB,Absents,Salary,Tax,Received_Salary)
VALUES ('Kiran','Tanuku',2,224221,'1996*10-24',3,25000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Santosh','Tanuku',3,224221,'1995*09-14',5,35000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Subramanyam','Pulivendula',2,224521,'1986*03-5',2,45000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Satish','Kavitam,',3,225321,'1998*12-09',3,33000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Saiteja','Palakollu',2,25632,'1997*08-29',9,42000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Bharat','Mukkamala',2,224221,'1995*06-08',4,60000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Sarath','Tanuku',3,224221,'1998*06-10',3,40000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents)),
('Prasad','Tanuku',2,224221,'1996*02-01',0,20000,30,(employee.Salary*(employee.Tax/100))*(30-employee.Absents));

SELECT * FROM employee;

