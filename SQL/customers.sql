USE employee_salary;
-- DROP TABLE customer;
CREATE TABLE customer(
		customer_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        Name_ VARCHAR(50) NOT NULL,
        Adress  VARCHAR(55) NOT NULL,
        Purchase_item  VARCHAR(50),
        Quantity int not null,
        Phone_number varchar(12) not null,
        Product_Amount double not null,
        Pay_amount  double not null,
        Date_ date,
        Remaining_Amount double
);

INSERT INTO customer(Name_, Adress, Purchase_item, Quantity, Phone_number, Product_Amount, Pay_amount, Date_, Remaining_Amount)
VALUES ('Anand','Bapatla','Bolts and rods',10, '918562142553',50*customer.Quantity,500,'2021-01-15',(customer.Pay_amount-customer.Product_Amount)),
('Vivek','Tanuku','Paints and brushes',25, '915326981156',550*customer.Quantity,2500,'2021-01-18',(customer.Pay_amount-customer.Product_Amount)),
('Koushik','VKP','Auxillery Pump parts',36, '918562114553',30*customer.Quantity,500,'2021-02-20',(customer.Pay_amount-customer.Product_Amount)),
('Nirmal','kanuru','Xeros Copies',500, '918252149553',2*customer.Quantity,1200,'2021-03-25',(customer.Pay_amount-customer.Product_Amount)),
('Anusha','Tanuku','Brooms and Makeup',200, '918562136253',26*customer.Quantity,500,'2021-04-06',(customer.Pay_amount-customer.Product_Amount)),
('Swati','Kakinada','Bangles and Earrings',8, '918256214253',50*customer.Quantity,1000,'2021-03-30',(customer.Pay_amount-customer.Product_Amount)),
('Harshavardan','Kavitam','Bushes and Bearings',30, '918562126553',20*customer.Quantity,226,'2021-12-06',(customer.Pay_amount-customer.Product_Amount)),
('Harika','vjwd','clock and Batteries',20, '918152142553',30*customer.Quantity,650,'2021-05-29',(customer.Pay_amount-customer.Product_Amount)),
('Raghu','Morta','Hammers and Nails',420, '918562142553',0.5*customer.Quantity,200,'2021-10-04',(customer.Pay_amount-customer.Product_Amount));








        