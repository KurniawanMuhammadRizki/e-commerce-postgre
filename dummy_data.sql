INSERT INTO Sellers (seller_name, seller_contact_number, seller_address) VALUES 
('COC Komputer', '081342356574', 'Jl. panjang');

INSERT INTO Customers (customer_name, customer_contact_number, customer_address) VALUES 
('Sum Ting Wong', '6281312341234', 'Digital Park, Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau, 29466');

INSERT INTO Shippers (shipper_name, shipper_details, shipper_price) VALUES 
('J&T - Reguler', 'some details', 126000);

INSERT INTO Promo (promo_name, promo_details, is_valid) VALUES 
('Promo Tokopedia', 'cash back', TRUE);

INSERT INTO Products (product_name, product_price) VALUES 
('SAPPHIRE NITRO+ Radeon RX 7900 XTX 24GB', '20500000');

INSERT INTO Invoice (invoice_number, seller_id, customer_id, shipper_id, purchase_date, shipping_fee, shipping_insurance_fee, service_fee, total_product_price, promo_id, promo_amount, service_application_fee, total_invoice, payment_method, last_update) VALUES 
('INV/2033011/MPL/3694776524', 1, 1, 1, '2024-05-22', 126000, 57700, 1000, 20500000, 1, 986385, 1000, 20685000, 'BCA Virtual Account', CURRENT_TIMESTAMP);

INSERT INTO Products_invoice (invoice_id, product_id, quantity, product_invoice_price, total_product_invoice_price, product_invoice_name) VALUES 
(1, 3, 1, 20500000, 20500000, 'SAPPHIRE NITRO+ Radeon RX 7900 XTX 24GB');
