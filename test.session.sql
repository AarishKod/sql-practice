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

-- @block
CREATE INDEX email_index ON Users(email);

-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);

-- @block
INSERT INTO Rooms (owner_id, street)
VALUES 
    (1, 'san diego sailboat'),
    (1, 'back bay apartment'),
    (1, 'vail cabin'),
    (1, 'sf studio'),

;

-- @block
SELECT Users.id AS user_id, Rooms.id AS room_id, street, email FROM Users
RIGHT JOIN Rooms
ON Rooms.owner_id = Users.id;

-- @block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);

-- @block
SELECT * FROM Bookings;
SELECT * From Rooms;
SELECT * FROM Users;

-- @block
INSERT INTO Bookings(guest_id, room_id)
VALUES 
    (1, 2),
    (9, 1),
    (3, 1),
    (1, 1);

-- @block Rooms a user has booked
SELECT
    guest_id,
    street,
    check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1

-- @block All guests who stayed in a specific room
SELECT * FROM Bookings
INNER JOIN Users ON Bookings.guest_id = guest_id
WHERE room_id = 2;

-- @block
SELECT * FROM Bookings
INNER JOIN Rooms on Rooms.id = room_id
LEFT JOIN Users on Users.id = guest_id

-- @block
DROP TABLE Bookings