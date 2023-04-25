create or replace FUNCTION count_records(p_table_name IN VARCHAR2) RETURN INTEGER AS
    n_records INTEGER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT COUNT(*) FROM ' || p_table_name INTO n_records;
    RETURN n_records;
END;
/