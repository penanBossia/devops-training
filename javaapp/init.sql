CREATE TABLE product (
	id varchar NOT NULL,
	title varchar NULL,
	price float4 NULL,
	CONSTRAINT product_pk PRIMARY KEY (id)
);

CREATE SEQUENCE seq_product
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


INSERT INTO product
(id, title, price)
VALUES
    (nextval('seq_product'), 'processeur', 575.0),
    (nextval('seq_product'), 'disque dur', 100.0),
    (nextval('seq_product'), 'barette memoire', 250.0);