
CREATE TABLE contacts (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(15),
  last_name VARCHAR(15),
  email text,
  phone_number text
);