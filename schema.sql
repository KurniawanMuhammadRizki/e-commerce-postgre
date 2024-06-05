-- public.customers definition

-- Drop table

-- DROP TABLE public.customers;

CREATE TABLE public.customers (
	customer_id bigserial NOT NULL,
	customer_name varchar(100) NOT NULL,
	customer_contact_number varchar(20) NOT NULL,
	customer_address varchar(255) NOT NULL,
	CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);

-- public.invoice definition

-- Drop table

-- DROP TABLE public.invoice;

CREATE TABLE public.invoice (
	invoice_id bigserial NOT NULL,
	invoice_number varchar(100) NOT NULL,
	seller_id int8 NOT NULL,
	customer_id int8 NOT NULL,
	shipper_id int8 NOT NULL,
	purchase_date date NOT NULL,
	shipping_fee int4 NOT NULL,
	shipping_insurance_fee int4 NOT NULL,
	service_fee int4 NOT NULL,
	total_product_price int4 NOT NULL,
	service_application_fee int4 NOT NULL,
	total_invoice int4 NOT NULL,
	last_update timestamp NOT NULL,
	CONSTRAINT invoice_pkey PRIMARY KEY (invoice_id)
);


-- public.invoice foreign keys

ALTER TABLE public.invoice ADD CONSTRAINT invoice_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
ALTER TABLE public.invoice ADD CONSTRAINT invoice_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);
ALTER TABLE public.invoice ADD CONSTRAINT invoice_shipper_id_fkey FOREIGN KEY (shipper_id) REFERENCES public.shippers(shipper_id);

-- public.payment_invoice definition

-- Drop table

-- DROP TABLE public.payment_invoice;

CREATE TABLE public.payment_invoice (
	payment_invoice_id bigserial NOT NULL,
	payment_method_id int8 NOT NULL,
	amount int8 NULL,
	invoice_id int8 NULL,
	CONSTRAINT payment_invoice_pk PRIMARY KEY (payment_invoice_id)
);


-- public.payment_invoice foreign keys

ALTER TABLE public.payment_invoice ADD CONSTRAINT payment_invoice_invoice_fk FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id);
ALTER TABLE public.payment_invoice ADD CONSTRAINT payment_invoice_payment_method_fk FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(payment_method_id);

-- public.payment_method definition

-- Drop table

-- DROP TABLE public.payment_method;

CREATE TABLE public.payment_method (
	payment_method_id int8 DEFAULT nextval('"payment-method_payment_method_id_seq"'::regclass) NOT NULL,
	payment_name varchar NOT NULL,
	payment_detail varchar NULL,
	CONSTRAINT payment_method_pk PRIMARY KEY (payment_method_id)
);
CREATE UNIQUE INDEX payment_method_payment_method_id_idx ON public.payment_method USING btree (payment_method_id);

-- public.products definition

-- Drop table

-- DROP TABLE public.products;

CREATE TABLE public.products (
	product_id bigserial NOT NULL,
	product_name varchar(200) NOT NULL,
	product_price varchar(20) NOT NULL,
	weight int4 NULL,
	seller_id int8 NULL,
	CONSTRAINT products_pkey PRIMARY KEY (product_id)
);


-- public.products foreign keys

ALTER TABLE public.products ADD CONSTRAINT products_seller_id_pk FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);

-- public.products_invoice definition

-- Drop table

-- DROP TABLE public.products_invoice;

CREATE TABLE public.products_invoice (
	product_invoice_id bigserial NOT NULL,
	invoice_id int8 NOT NULL,
	product_id int8 NOT NULL,
	quantity int4 NOT NULL,
	product_invoice_price int4 NOT NULL,
	total_product_invoice_price int4 NOT NULL,
	product_invoice_name varchar(200) NOT NULL,
	product_invoice_weight int4 NULL,
	product_invoice_seller_id int8 NOT NULL,
	CONSTRAINT products_invoice_pkey PRIMARY KEY (product_invoice_id)
);


-- public.products_invoice foreign keys

ALTER TABLE public.products_invoice ADD CONSTRAINT products_invoice_invoice_id_fkey FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id);
ALTER TABLE public.products_invoice ADD CONSTRAINT products_invoice_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);

-- public.promo definition

-- Drop table

-- DROP TABLE public.promo;

CREATE TABLE public.promo (
	promo_id bigserial NOT NULL,
	promo_name varchar(200) NOT NULL,
	promo_details varchar(20) NOT NULL,
	is_valid bool NOT NULL,
	CONSTRAINT promo_pkey PRIMARY KEY (promo_id)
);

-- public.promo_invoice definition

-- Drop table

-- DROP TABLE public.promo_invoice;

CREATE TABLE public.promo_invoice (
	promo_invoice_id bigserial NOT NULL,
	invoice_id int8 NOT NULL,
	promo_id int8 NOT NULL,
	amount int8 NULL,
	CONSTRAINT promo_invoice_pk PRIMARY KEY (promo_invoice_id)
);


-- public.promo_invoice foreign keys

ALTER TABLE public.promo_invoice ADD CONSTRAINT promo_invoice_invoice_fk FOREIGN KEY (invoice_id) REFERENCES public.invoice(invoice_id);
ALTER TABLE public.promo_invoice ADD CONSTRAINT promo_invoice_promo_fk FOREIGN KEY (promo_id) REFERENCES public.promo(promo_id);

-- public.sellers definition

-- Drop table

-- DROP TABLE public.sellers;

CREATE TABLE public.sellers (
	seller_id bigserial NOT NULL,
	seller_name varchar(100) NOT NULL,
	seller_contact_number varchar(20) NOT NULL,
	seller_address varchar(255) NOT NULL,
	CONSTRAINT sellers_pkey PRIMARY KEY (seller_id)
);

-- public.shippers definition

-- Drop table

-- DROP TABLE public.shippers;

CREATE TABLE public.shippers (
	shipper_id bigserial NOT NULL,
	shipper_name varchar(200) NOT NULL,
	shipper_details varchar(20) NOT NULL,
	shipper_price int4 NOT NULL,
	CONSTRAINT shippers_pkey PRIMARY KEY (shipper_id)
);
