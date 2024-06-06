select
	s.seller_name,
	invoice.purchase_date,
	c.customer_name,
	c.customer_address,
	c.customer_contact_number,
	shp.shipper_name,
	shp.shipper_details,
	invoice.shipping_fee,
	invoice.shipping_insurance_fee,
	string_agg(pi2.product_invoice_name,
	', ') as product_invoice_name,
	string_agg(pi2.quantity::text,
	', ') as quantity,
	string_agg(pi2.product_invoice_price::text,
	', ') as product_invoice_price,
	sum(pi2.total_product_invoice_price) as total_product_invoice_price,
	sum(pi3.amount) as promo_amount,
	p.promo_name,
	sum(pi4.amount) as total_payment_amount,
	pm.payment_name,
	invoice.last_update
from
	invoice
inner join customers c on
	invoice.customer_id = c.customer_id
inner join sellers s on
	invoice.seller_id = s.seller_id
inner join shippers shp on
	invoice.shipper_id = shp.shipper_id
inner join products_invoice pi2 on
	invoice.invoice_id = pi2.invoice_id
inner join promo_invoice pi3 on
	invoice.invoice_id = pi3.invoice_id
inner join promo p on
	pi3.promo_id = p.promo_id
inner join payment_invoice pi4 on
	invoice.invoice_id = pi4.invoice_id
inner join payment_method pm on
	pi4.payment_method_id = pm.payment_method_id
group by
	s.seller_name,
	invoice.purchase_date,
	c.customer_name,
	c.customer_address,
	c.customer_contact_number,
	shp.shipper_name,
	shp.shipper_details,
	invoice.shipping_fee,
	invoice.shipping_insurance_fee,
	invoice.total_invoice,
	p.promo_name,
	pm.payment_name,
	invoice.last_update ;
