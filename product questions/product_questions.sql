# connection
# hostname: 127.0.0.1
# username: root
# password: mysql
# database: bookstore_awzm

# select book by isbn
SELECT * FROM books_with_authors WHERE isbn = {isbn};

# select book by title
SELECT * FROM books_with_authors WHERE title = {title}

# add delivery
INSERT INTO deliveries (isbn, qty, f_price) VALUES {isbn}, {qty}, {f_price};
