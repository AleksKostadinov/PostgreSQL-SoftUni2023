CREATE OR REPLACE PROCEDURE
	sp_withdraw_money(account_id INT, money_amount NUMERIC(10, 4))
LANGUAGE plpgsql
AS $$
BEGIN
	IF (
		money_amount < 0
		OR
		(
			SELECT balance
			FROM accounts
			WHERE id = account_id
		) < money_amount
		) THEN
		RAISE NOTICE 'NOTICE: Insufficient balance to withdraw %',  money_amount;
	ELSE
		UPDATE accounts
		SET balance = balance - money_amount
		WHERE id = account_id;
		COMMIT;
	END IF;
END;
$$;


CALL sp_withdraw_money(3, 5050.7500);

CALL sp_withdraw_money(6, 5437.00);

DROP PROCEDURE sp_withdraw_money;
