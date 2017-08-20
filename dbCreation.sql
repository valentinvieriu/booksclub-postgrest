CREATE DATABASE IF NOT EXISTS booksclub
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


-- Run the next code in the vooksclub database

BEGIN;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS description;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS suggestions;

CREATE TABLE book (
	id text PRIMARY KEY,
	data json,
    long_description text,
	meta_description text,
    bestseller_order bigint,
    last_updated timestamp
);

CREATE TABLE category (
	id int PRIMARY KEY,
	name text NOT NULL,
	parent_id int REFERENCES category(id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE categories (
	book_id text NOT NULL REFERENCES book(id) 
        ON UPDATE CASCADE ON DELETE CASCADE,
	category_id int NOT NULL REFERENCES category(id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE suggestions (
	book_id text NOT NULL REFERENCES book(id) 
        ON UPDATE CASCADE ON DELETE CASCADE,
	suggestion_id TEXT NOT NULL REFERENCES book(id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

COMMIT;