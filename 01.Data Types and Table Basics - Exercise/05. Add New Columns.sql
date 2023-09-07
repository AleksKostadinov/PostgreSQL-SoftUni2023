ALTER TABLE minions_info
    ADD COLUMN email VARCHAR(20);

ALTER TABLE minions_info
    ADD COLUMN equipped BOOLEAN NOT NULL;
