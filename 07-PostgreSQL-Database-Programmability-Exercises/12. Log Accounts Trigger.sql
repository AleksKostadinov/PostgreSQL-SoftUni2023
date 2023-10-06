CREATE TABLE logs (
	"id" SERIAL PRIMARY KEY,
	account_id INT,
	old_sum NUMERIC(10, 4),
	new_sum NUMERIC(10, 4)
);

CREATE FUNCTION
	trigger_fn_insert_new_entry_into_logs()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO "logs" (
		account_id,
		old_sum,
		new_sum
	)
	VALUES (
		OLD."id",
		OLD.balance,
		NEW.balance
	);
	RETURN NEW;
END;
$$;

CREATE TRIGGER
	tr_account_balance_change
AFTER UPDATE ON accounts
FOR EACH ROW
WHEN (OLD.balance <> NEW.balance)
EXECUTE FUNCTION trigger_fn_insert_new_entry_into_logs();

