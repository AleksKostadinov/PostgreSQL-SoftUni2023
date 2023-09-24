CREATE OR REPLACE PROCEDURE
	sp_transfer_money(sender_id INT, receiver_id INT, amount NUMERIC(10, 4))
LANGUAGE plpgsql
AS $$
BEGIN
	IF
		EXISTS (SELECT 1 FROM accounts WHERE id=sender_id) AND
		EXISTS (SELECT 1 FROM accounts WHERE id=receiver_id) AND
		(
			SELECT
				balance
			FROM accounts
			WHERE id = sender_id
		) >= amount	THEN
		CALL sp_withdraw_money(sender_id, amount);
		CALL sp_deposit_money(receiver_id, amount);
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END;
$$;

CALL sp_transfer_money(5, 1, 5000);

CALL sp_transfer_money(10, 2, 1043.90);

CALL sp_transfer_money(13, 15, 400.90);
