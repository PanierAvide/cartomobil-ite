--  Determine the status_order
CREATE OR REPLACE FUNCTION status_order_value(status VARCHAR) RETURNS INTEGER AS $$
BEGIN
	CASE status
		WHEN 'yes' THEN RETURN 1;
		WHEN 'limited' THEN RETURN 2;
		WHEN 'unknown' THEN RETURN 3;
		WHEN 'no' THEN RETURN 4;
		ELSE RETURN 5;
	END CASE;
END;
$$ LANGUAGE plpgsql;
