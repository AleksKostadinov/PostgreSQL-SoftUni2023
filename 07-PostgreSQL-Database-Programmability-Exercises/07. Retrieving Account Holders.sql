CREATE PROCEDURE
	sp_retrieving_holders_with_balance_higher_than(searched_balance NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
    holder_record RECORD;
    total_balance NUMERIC;
BEGIN
    FOR holder_record IN
        SELECT first_name, last_name
        FROM account_holders
        ORDER BY first_name, last_name
    LOOP
        total_balance := 0;
        SELECT
        	SUM(balance)
        INTO total_balance
        FROM accounts
        WHERE account_holder_id = (
            SELECT id
            FROM account_holders
            WHERE first_name = holder_record.first_name
            AND last_name = holder_record.last_name
        );

        IF total_balance > searched_balance THEN
            RAISE NOTICE 'NOTICE: % % - %', holder_record.first_name, holder_record.last_name, total_balance;
        END IF;
    END LOOP;
END;
$$;


CALL sp_retrieving_holders_with_balance_higher_than(20000);
