DROP table employee_salary.purchases;

USE employee_salary;

CREATE TABLE purchases(
		serial_no INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        Maida DOUBLE,
        Sugar DOUBLE,
        Salt DOUBLE,
        Dal DOUBLE,
        Mehl DOUBLE,
        Oil DOUBLE,
        Packing_reel DOUBLE,
        Cartoon_Box  DOUBLE,
        sum DOUBLE
);

INSERT INTO purchases ( Maida, Sugar, salt, Dal, Mehl, Oil, Packing_reel, Cartoon_Box, sum ) 
VALUES (2,5,5,9,6,3,4,8, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (4,6,2,7,9,4,3,2, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (6,1,5,4,1,3,8,1, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (4,3,9,4,2,6,4,6, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (7,1,2,5,9,3,4,4, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (3,4,2,7,4,5,9,2, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (9,4,3,4,5,9,4,2, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box),
        (5,4,7,6,5,1,7,7, 
		purchases.Maida + purchases.Sugar + purchases.salt + purchases.Dal + purchases.Mehl + purchases.Oil + purchases.Packing_reel + purchases.Cartoon_Box);
        
        
        
        
        
        
        
        
        
        
        
        