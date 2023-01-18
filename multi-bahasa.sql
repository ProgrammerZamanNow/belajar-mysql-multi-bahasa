CREATE database studikasus_multi_bahasa;

USE studikasus_multi_bahasa;

CREATE TABLE categories
(
    id       VARCHAR(100),
    position INT,
    PRIMARY KEY (id)
) ENGINE InnoDB;

DESCRIBE categories;

INSERT INTO categories(id, position)
VALUES ('FOOD', 1);
INSERT INTO categories(id, position)
VALUES ('GADGET', 2);
INSERT INTO categories(id, position)
VALUES ('FASHION', 3);

SELECT *
FROM categories
ORDER BY position;

CREATE TABLE categories_translations
(
    category_id VARCHAR(100) NOT NULL,
    language    VARCHAR(100) NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    PRIMARY KEY (category_id, language)
) ENGINE InnoDB;

DESC categories_translations;

ALTER TABLE categories_translations
    ADD CONSTRAINT fk_categories_translation
        FOREIGN KEY (category_id) REFERENCES categories (id);

INSERT INTO categories_translations(category_id, language, name, description)
VALUES ('FOOD', 'in_ID', 'Makanan', 'Deskripsi Makanan');
INSERT INTO categories_translations(category_id, language, name, description)
VALUES ('FOOD', 'en_US', 'Food', 'Food Description');
INSERT INTO categories_translations(category_id, language, name, description)
VALUES ('GADGET', 'in_ID', 'Gawai', 'Deskripsi Gawai');
INSERT INTO categories_translations(category_id, language, name, description)
VALUES ('GADGET', 'en_US', 'Gadget', 'Gadget Description');

SELECT * FROM categories
    JOIN categories_translations ct on categories.id = ct.category_id
WHERE ct.language = 'en_US' ORDER BY position;