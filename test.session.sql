-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

-- @block
INSERT INTO Users (email, bio, country)
VALUES
    ("yes@gmial.com", "renjkfds", "UK"),
    ("german@u.com", "invea", "CT"),
    ("northeastern@res.com", "cew", "MA");

-- @block
SELECT email, id FROM Users

WHERE email LIKE "a%"

ORDER BY id DESC;