use ecommerce;

-- Total de clientes
select count(*) as Total_Clients from clients;

-- Total de pedidos
select count(*) as Total_Orders from clients c, orders o where c.idClient = idOrderClient;

-- Total de produtos
select count(*) as Total_products from product;

-- Produtos Disponíveis
select Pname as Product, category, avaliação from product order by Pname;

-- Pedidos por cliente
select concat(Fname,' ',Lname) as ClientName, orderStatus, orderDescription from clients c, orders o
		where c.idClient = idOrderClient
        order by orderStatus desc;

-- endereço dos clientes que possuem pedido
select concat(Fname,' ',Lname) as ClientName, CPF, orderStatus, sendValue, UF, zipCode, City, Street from clients c, Adress a, orders o
	where c.idClient = idOrderClient and c.idClient = a.idClient
    having orderStatus = 'Em processamento';

-- recuperação de pedido com produto associado
select idOrder, concat(Fname,' ',Lname) as ClientName, orderStatus, Pname from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
                inner join productOrder po on po.idPOorder = o.idOrder
                inner join product p on p.idProduct = po.idPOproduct;
        
-- Quantos pedidos foram realizados pelo cliente?
select c.idClient, Fname, count(*) as Number_of_orders from clients c 
				inner join orders o ON c.idClient = o.idOrderClient
		group by c.idClient;

-- Relação fornecedores e seus produtos
select SocialName as Supplier_Name, contact, Pname, category, quantity from supplier s, product p, productSupplier ps
		where s.idSupplier = ps.idPsSupplier and p.idProduct = ps.idPsProduct;

-- Relação vendedores e produtos
select SocialName as Seller_Name, contact, Pname, prodQuantity, category from seller s
				inner join productSeller ps on s.idSeller = ps.idPseller
                inner join product p on p.idProduct = ps.idPproduct;

-- Relação vendedores e fornecedores
select p.idProduct, p.Pname, s.SocialName as Seller_Name, s.contact, f.SocialName as Supplier_Name, f.contact, category from seller s
		inner join productSeller ps on s.idSeller = ps.idPseller
        inner join product p on p.idProduct = ps.idPproduct
        inner join productSupplier pf on p.idProduct = pf.idPsProduct
        inner join supplier f on pf.idPsSupplier = f.idSupplier
        order by idProduct;

-- Total de produtos por fornecedor
select SocialName as Supplier_name, count(*) as supplier_products from supplier s
		inner join productSupplier ps on s.idSupplier = ps.idPsSupplier
        inner join product p on p.idProduct = ps.idPsProduct
        group by SocialName;

-- Total de produtos por vendedor
select SocialName as Seller_Name, count(*) as Seller_products from seller s, productSeller ps, product p
		where s.idSeller = ps.idPseller and p.idProduct = ps.idPproduct
        group by SocialName;

-- Quantidade de produtos no estoque
select Pname, quantity from productStorage s
	inner join storageLocation l on s.idProdStorage = l.idLstorage
    inner join product p on p.idProduct = l.idLproduct
    order by quantity;

-- Locais de estoque dos produtos
select Pname, storageLocation, location from storageLocation l, productStorage s, product p
	where s.idProdStorage = l.idLstorage and p.idProduct = l.idLproduct;
