CREATE TABLE Shelf (
    shelf_id VARCHAR(5) NOT NULL,
    PRIMARY KEY(shelf_id)
    );

CREATE TABLE Author (
    author_id  INT(11) NOT NULL AUTO_INCREMENT,
    author_fname VARCHAR(255),
    author_lname VARCHAR(255),
    PRIMARY KEY (author_id)   
    );


CREATE TABLE Books (
    isbn INT(11) NOT NULL,
    title VARCHAR(255),
    author_id INT(11),
    shelf_id VARCHAR(5),
    description VARCHAR(255),
    sale_factor  FLOAT(7,4),
    PRIMARY KEY(isbn), 
    FOREIGN KEY (shelf_id) REFERENCES Shelf(shelf_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)   
    );

    
CREATE TABLE Delivery (
    delivery_id INT(25) NOT NULL AUTO_INCREMENT,
    deliv_date TIMESTAMP,
    isbn INT(11),
    f_price  FLOAT(7,4),
    quantity INT(11),
    PRIMARY KEY(delivery_id),
    FOREIGN KEY (isbn) REFERENCES Books(isbn)
    );   
    
CREATE TABLE Sales (
    sale_id INT(11) NOT NULL AUTO_INCREMENT,
    sale_date TIMESTAMP,
    isbn INT(11),
    sale_price  FLOAT(7,4),
    shelf_id VARCHAR(5),
    quantity INT(11),
    PRIMARY KEY(sale_id),    
    FOREIGN KEY (isbn) REFERENCES Books(isbn),
    FOREIGN KEY (shelf_id) REFERENCES Shelf(shelf_id)
    );
**************************************QUERIES**********************************************



INLEVERANS
INSERT INTO Shelf (shelf_id)
VALUES  ("H6");
INSERT INTO Author (author_fname, author_lname)
VALUES ("Sven", "Blind");
INSERT INTO Books (isbn, title, author_id, shelf_id, description, sale_factor)
VALUES (150, "Yoghurt", LAST_INSERT_ID(), LAST_INSERT_ID(), "Oj så gott !", 1.8);
INSERT INTO Delivery (f_price, quantity)
VALUES (127, 33);




¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
Uppdatera försäljningsfaktor
UPDATE Books SET sale_factor = (1.8) WHERE isbn = 150;
