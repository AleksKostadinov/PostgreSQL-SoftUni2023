ALTER TABLE IF EXISTS employees
    ALTER COLUMN hiring_date SET NOT NULL;

ALTER TABLE IF EXISTS employees
    ALTER COLUMN salary SET DEFAULT 0;

ALTER TABLE IF EXISTS employees
    ALTER COLUMN salary SET NOT NULL;