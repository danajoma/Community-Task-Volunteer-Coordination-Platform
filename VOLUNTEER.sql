CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    role ENUM('volunteer','creator','admin') NOT NULL DEFAULT 'volunteer',
    status ENUM('active','inactive') DEFAULT 'active'
);

CREATE TABLE Activity (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    creator_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    date DATETIME NOT NULL,
    expected_volunteers INT DEFAULT 0,
    status ENUM('pending','approved','rejected') DEFAULT 'pending',
    FOREIGN KEY (creator_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    activity_id INT NOT NULL,
    volunteer_id INT NOT NULL,
    status ENUM('pending','approved','rejected') DEFAULT 'pending',
    sign_up_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (activity_id) REFERENCES Activity(activity_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (volunteer_id) REFERENCES User(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
