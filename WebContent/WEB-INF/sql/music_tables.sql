-- Create celebrity table
CREATE TABLE IF NOT EXISTS celebrity (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    bio TEXT,
    image_url VARCHAR(512),
    profession VARCHAR(100) NOT NULL,
    achievements TEXT,
    birth_date TIMESTAMP,
    birth_place VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_profession (profession),
    INDEX idx_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create music table
CREATE TABLE IF NOT EXISTS music (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    image_url VARCHAR(512),
    audio_url VARCHAR(512),
    celebrity_id INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (celebrity_id) REFERENCES celebrity(id) ON DELETE CASCADE,
    INDEX idx_genre (genre),
    INDEX idx_release_year (release_year),
    INDEX idx_title (title)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert sample celebrity data
INSERT INTO celebrity (name, bio, image_url, profession, achievements, birth_date, birth_place) VALUES
(
    'Nusrat Fateh Ali Khan',
    'Nusrat Fateh Ali Khan was a Pakistani vocalist, musician and music director. He was primarily a singer of Qawwali, a form of Sufi Islamic devotional music.',
    'https://upload.wikimedia.org/wikipedia/en/d/d1/Nusrat_Fateh_Ali_Khan.jpg',
    'Qawwali Singer',
    'UNESCO Music Prize, Pride of Performance, Legend Award',
    '1948-10-13',
    'Faisalabad, Pakistan'
),
(
    'Abida Parveen',
    'Abida Parveen is a Pakistani singer, composer and musician of Sufi music. She is also a painter and entrepreneur.',
    'https://upload.wikimedia.org/wikipedia/commons/7/7e/Abida_Parveen.jpg',
    'Sufi Singer',
    'Pride of Performance, Sitara-e-Imtiaz, Lifetime Achievement Award',
    '1954-02-20',
    'Larkana, Pakistan'
),
(
    'Atif Aslam',
    'Atif Aslam is a Pakistani playback singer, songwriter, composer and actor. He has recorded numerous chart-topping songs in both Pakistan and India.',
    'https://upload.wikimedia.org/wikipedia/commons/1/1c/Atif_Aslam_at_Badlapur_concert.jpg',
    'Pop Singer',
    'Tamgha-e-Imtiaz, Multiple Lux Style Awards',
    '1983-03-12',
    'Wazirabad, Pakistan'
);

-- Insert sample music data
INSERT INTO music (title, description, image_url, audio_url, celebrity_id, genre, release_year) VALUES
(
    'Tumhe Dillagi',
    'A soulful rendition of the classic love song that captures the essence of Pakistani pop music.',
    'https://example.com/images/tumhe-dillagi.jpg',
    'https://example.com/audio/tumhe-dillagi.mp3',
    3,
    'Pop',
    2016
),
(
    'Mustt Mustt',
    'A legendary Qawwali performance that blends traditional Sufi music with modern elements.',
    'https://example.com/images/mustt-mustt.jpg',
    'https://example.com/audio/mustt-mustt.mp3',
    1,
    'Sufi',
    1990
),
(
    'Tere Ishq Nachaya',
    'A powerful Sufi kalaam that showcases the spiritual depth of Pakistani music.',
    'https://example.com/images/tere-ishq-nachaya.jpg',
    'https://example.com/audio/tere-ishq-nachaya.mp3',
    2,
    'Sufi',
    2005
);

-- Create indexes for better performance
CREATE INDEX idx_music_celebrity ON music(celebrity_id);
CREATE INDEX idx_music_genre_year ON music(genre, release_year);
CREATE INDEX idx_celebrity_profession ON celebrity(profession, name);
