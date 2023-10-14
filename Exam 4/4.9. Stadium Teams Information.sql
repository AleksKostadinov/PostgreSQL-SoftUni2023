CREATE OR REPLACE FUNCTION
    fn_stadium_team_name(stadium_name varchar(30))
RETURNS TABLE (
    team_name varchar(255)
    )
AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.name
    FROM
        teams t
    JOIN stadiums s ON
        s.id = t.stadium_id
    WHERE
        s.name = stadium_name
    ORDER BY
        t.name;
END;
$$ LANGUAGE plpgsql;
