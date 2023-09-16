CREATE TABLE mountains(
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks(
    id INT GENERATED ALWAYS AS IDENTITY UNIQUE,
    name VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY(mountain_id) REFERENCES mountains(id)
);


