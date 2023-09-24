CREATE OR REPLACE PROCEDURE
	sp_deposit_money(account_id INT, money_amount NUMERIC(10, 4))
LANGUAGE plpgsql
AS $$
BEGIN
	IF EXISTS (
		SELECT 1 FROM accounts
		WHERE id = account_id
	) THEN
	UPDATE accounts
	SET balance = balance + money_amount
	WHERE id = account_id;
	END IF;
	COMMIT;
END;
$$;

CALL sp_deposit_money(6, 1000);

DROP PROCEDURE sp_deposit_money;

--CREATE OR REPLACE PROCEDURE
--	sp_deposit_money(account_id INT, money_amount NUMERIC(10, 4))
--LANGUAGE plpgsql
--AS $$
--BEGIN
--	UPDATE accounts
--	SET balance = balance + money_amount
--	WHERE id = account_id;
--	COMMIT;
--END;
--$$;

--CREATE OR REPLACE PROCEDURE
--	sp_deposit_money(account_id INT, money_amount NUMERIC(10, 4))
--LANGUAGE plpgsql
--AS $$
--BEGIN
--	IF (money_amount <= 0) THEN
--		ROLLBACK;
--	ELSE
--		UPDATE accounts
--		SET balance = balance + money_amount
--		WHERE id = account_id;
--	END IF;
--	COMMIT;
--END;
--$$;
