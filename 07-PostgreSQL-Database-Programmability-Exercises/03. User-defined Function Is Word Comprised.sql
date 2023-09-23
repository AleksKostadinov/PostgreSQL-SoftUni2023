CREATE FUNCTION fn_is_word_comprised(
	set_of_letters VARCHAR(50),
	word VARCHAR(50)
	)
RETURNS BOOL
AS $$
DECLARE
	cleaned_set_of_letters VARCHAR(50);
	cleaned_word VARCHAR(50);
	letter_index INT;
	letter_count INT;

BEGIN
	cleaned_set_of_letters := LOWER(set_of_letters);
	cleaned_word := LOWER(word);
	letter_index := 1;
	letter_count := LENGTH(cleaned_word);

	WHILE letter_index <= letter_count LOOP
		IF POSITION(SUBSTRING(cleaned_word, letter_index, 1) IN cleaned_set_of_letters) = 0 THEN
	    RETURN FALSE;
	    END IF;
	        letter_index := letter_index + 1;
	END LOOP;
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

SELECT fn_is_word_comprised('ois tmiah%f',	'Sofia');
SELECT fn_is_word_comprised('ois tmiah%f', 'halves');
SELECT fn_is_word_comprised('R@o!B$B', 'Bob');
