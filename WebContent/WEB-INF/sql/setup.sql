-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE
);

-- Movies table
CREATE TABLE IF NOT EXISTS movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    director VARCHAR(100),
    year INT,
    language VARCHAR(50),
    genre VARCHAR(50),
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE
);

-- Tourist Places table
CREATE TABLE IF NOT EXISTS tourist_places (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    province VARCHAR(50),
    category VARCHAR(50),
    best_time_to_visit VARCHAR(100),
    how_to_reach TEXT,
    entry_fee DECIMAL(10,2),
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE
);

-- Sports table
CREATE TABLE IF NOT EXISTS sports (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    type VARCHAR(50),
    popularity VARCHAR(50),
    season VARCHAR(50),
    equipment TEXT,
    venues TEXT,
    famous_players TEXT,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE
);

-- Comments table
CREATE TABLE IF NOT EXISTS comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    movie_id INT,
    place_id INT,
    sport_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id),
    FOREIGN KEY (place_id) REFERENCES tourist_places(id),
    FOREIGN KEY (sport_id) REFERENCES sports(id)
);

-- Insert default admin user (password: admin123)
INSERT INTO users (username, email, password, is_admin) 
VALUES ('admin', 'admin@example.com', '$2a$10$xLNY7Vm5Xb7Ul3x3spQpEOyF9HqiOWuXEPqXZ7.BWkM/hzVHhP7.q', true)
ON DUPLICATE KEY UPDATE username=username;

-- Insert sample movies
INSERT INTO movies (title, description, director, year, language, genre) VALUES
('Khuda Kay Liye', 'A powerful drama about music and religious extremism', 'Shoaib Mansoor', 2007, 'Urdu', 'Drama'),
('Bol', 'A social drama addressing various societal issues', 'Shoaib Mansoor', 2011, 'Urdu', 'Drama'),
('Punjab Nahi Jaungi', 'A romantic comedy set in Punjab', 'Nadeem Baig', 2017, 'Urdu', 'Romance');

-- Insert sample tourist places
INSERT INTO tourist_places (name, description, location, province, category, best_time_to_visit) VALUES
('Badshahi Mosque', 'One of the largest mosques in the world', 'Lahore', 'Punjab', 'Historical', 'October to March'),
('Hunza Valley', 'Beautiful mountain valley with stunning views', 'Hunza', 'GB', 'Natural', 'May to October'),
('Mohenjo-daro', 'Ancient Indus Valley Civilization ruins', 'Larkana', 'Sindh', 'Historical', 'November to February');

-- Insert sample sports
INSERT INTO sports (name, description, type, popularity, season) VALUES
('Cricket', 'The most popular sport in Pakistan', 'Modern', 'High', 'All Year'),
('Hockey', 'National sport of Pakistan', 'National', 'Medium', 'All Year'),
('Kabaddi', 'Traditional contact sport', 'Traditional', 'High', 'Winter');
