-- Гарибов Хаял
CREATE TABLE IF NOT EXISTS building_types (
    type_code SERIAL PRIMARY KEY,
    type_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS districts (
    district_code SERIAL PRIMARY KEY,
    district_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS building_materials (
    material_code SERIAL PRIMARY KEY,
    material_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS real_estate_objects (
    object_code SERIAL PRIMARY KEY,
    district INT,
    address VARCHAR(255),
    floor SMALLINT,
    rooms_count SMALLINT,
    type SMALLINT,
    status BOOLEAN,
    price INT,
    description TEXT,
    building_material INT,
    area SMALLINT,
    listing_date DATE
);

CREATE TABLE IF NOT EXISTS evaluation_criteria (
    criterion_code SERIAL PRIMARY KEY,
    criterion_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS evaluations (
    evaluation_code SERIAL PRIMARY KEY,
    object_code INT,
    evaluation_date DATE,
    criterion_code SMALLINT,
    score DOUBLE PRECISION
);

CREATE TABLE IF NOT EXISTS realtors (
    realtor_code SERIAL PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    phone_number VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS sales (
    sale_code SERIAL PRIMARY KEY,
    object_code INT,
    sale_date DATE,
    realtor_code INT,
    price DOUBLE PRECISION
);