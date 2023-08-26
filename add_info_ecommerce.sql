-- inserção de dados e queries
use ecommerce;

-- idClient, Fname, Minit, Lname, CPF, Bdate
insert into Clients (Fname, Minit, Lname, CPF, Bdate) 
	   values('Marcos','P','Moreira', 587632149, '1975-12-21'),
		     ('Renato','O','Lourenço', 456793182,'1985-07-14'),
			 ('Ricardo','J','Silva', 45678913,'1996-06-16'),
			 ('Juliano','R','Cunha', 332541676,'1997-01-08'),
			 ('Roberta','G','Assis', 662174561,'1983-11-30'),
			 ('Isabela','M','Nascimento', 654789123,'1973-03-01'),
             ('Stephany','G','Santana', 745689221,'1976-08-16');

-- idClient, Street, zipCode, City, UF
insert into Adress (idClient, Street, zipCode, City, UF)
	values('8', 'Rua Salomão,27', '11850000', 'Miracatu', 'SP'),
		  ('9', 'Rua José Miranda,43', '11850000', 'Miracatu', 'SP'),
          ('10', 'Rua Independência,37', '11850000', 'Miracatu', 'SP'),
          ('11', 'Avenida Fantasia,77', '13409103', 'Piracicaba', 'SP'),
          ('12', 'Rua Alfajor,86', '13409103', 'Piracicaba', 'SP'),
          ('13', 'Rua Frei Dantas,53', '68960000', 'Almeriana', 'AP'),
          ('14', 'Avenida Capataz,37', '77645000', 'Lajeado', 'TO');
    
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
							  ('Fone de ouvido',false,'Eletrônico','4',null),
                              ('Barbie Elsa',true,'Brinquedos','3',null),
                              ('Body Carters',true,'Vestimenta','5',null),
                              ('Microfone Vedo - Youtuber',False,'Eletrônico','4',null),
                              ('Sofá retrátil',False,'Móveis','3','3x57x80'),
                              ('Farinha de arroz',False,'Alimentos','2',null),
                              ('Fire Stick Amazon',False,'Eletrônico','3',null);

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values 
							 (8, default,'compra via aplicativo',null,1),
                             (9,default,'compra via aplicativo',50,0),
                             (10, 'Confirmado',null,20,0),
                             (11, 'Cancelado','Pagamento não aprovado',null,0),
                             (12,'Confirmado',null,35,1),
                             (13,'Confirmado',null,null,1),
                             (14,default,'compra via web site',150,0);

-- idClient, idPayment, typePayment, limitAvailable
insert into payments (idClient, idPayment, typePayment, limitAvailable) values
				(11, 1, 'Boleto', null),
                (12, 2, 'Cartão', 3400.00),
                (9, 3, 'Cartão', 2600.00);

-- storageLocation,quantity
insert into productStorage (storageLocation,quantity) values 
							('São Paulo',996),
                            ('Rio de Janeiro',507),
                            ('Goiânia',10),
                            ('Belo Horizonte',290),
                            ('Manaus',118),
                            ('Brasília',47),
                            ('Salvador',336);

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values 
							('Tech4u', 987445682645871,'21985474'),
                            ('Eletrônicos Silva',854519649143457,'21985484'),
                            ('Silva & Silva', 934567893934695,'21975474');

-- idSeller, SocialName, CNPJ, CPF, location, contact
insert into seller (SocialName, CNPJ, CPF, location, contact) values 
						('Tech eletronics', 123456789456321, null, 'Rio de Janeiro', 219946287),
					    ('Botique Durgas',null, 123456783,'Rio de Janeiro', 219567895),
                        ('Casa do Construtor', 369258741498266, null, 'Araraquara', 1218472695),
						('Kids World', 456789123654485,null,'São Paulo', 1198657484);

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
						(1, 1, 233),
                        (1, 4, 122),
                        (1, 7, 59),
                        (2, 6, 88),
                        (3, 5, 91),
                        (4, 2, 122),
                        (4, 3, 35);
           
-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						 (5,9,1,default),
                         (1,15,1,default),
                         (2,13,8,null),
                         (3,10,1,null),
                         (4,14,1,default),
                         (6,11,4,null),
                         (7,12,3,'Sem estoque');

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						 (7,7,'SP'),
                         (3,8,'RJ'),
                         (6,9,'GO'),
                         (1,10,'MG'),
                         (4,11,'AM'),
                         (2,12,'DF'),
                         (5,13,'BA');

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						 (1,1,500),
                         (1,2,400),
                         (2,4,633),
                         (3,3,46),
                         (3,5,10),
                         (3,6,13),
                         (2,7,34);