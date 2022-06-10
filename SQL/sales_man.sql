USE employee_salary;
-- DROP TABLE IF EXISTS employee_salary.sales_man;


CREATE TABLE sales_man (
		id INT NOT NULL PRIMARY KEY auto_increment,
        Name_ varchar(50) NOT NULL,
        Adress varchar(50) NOT NULL,
        Purchase_items varchar(50) ,
        Quantity double,
        Phone varchar (12) NOT NULL,
        purchase_amount double NOT NULL,
        paid_amount double NOT NULL,
        date_ date,
        remaining_amount double NOT NULL
);

INSERT INTO sales_man (Name_, Adress, Purchase_items, Quantity, Phone, purchase_amount, paid_amount ,date_, remaining_amount)
VALUE ('Visal', 'kanuru','bolts and nuts', 15 , '4589961--', sales_man.Quantity*50, 600, '2021-01-15' , sales_man.paid_amount-sales_man.purchase_amount),
		('Srikanth', 'Humburg','Paints', 50 , '455599961--', sales_man.Quantity*250, 6520, '2021-09-15' , sales_man.paid_amount-sales_man.purchase_amount),
        ('Frank', 'Paris','Pipes', 89 , '45895661--', sales_man.Quantity*150, 5000, '2025-07-30' , sales_man.paid_amount-sales_man.purchase_amount),
        ('Tylor', 'Newyork','L-Bows', 562 , '458785961--', sales_man.Quantity*560, 23000, '2022-12-25' , sales_man.paid_amount-sales_man.purchase_amount),
        ('Lisa', 'Kiyv','Lentils', 45 , '4524856--', sales_man.Quantity*20,960, '2012-09-07' , sales_man.paid_amount-sales_man.purchase_amount),
        ('jegar', 'paradise','breads', 250 , '4548961--', sales_man.Quantity*15, 5000, '2022-02-05' , sales_man.paid_amount-sales_man.purchase_amount);






