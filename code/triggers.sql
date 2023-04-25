create or replace TRIGGER book_insert_trig
BEFORE INSERT ON Book
FOR EACH ROW
DECLARE
    n_rows INTEGER;
BEGIN
    SELECT COUNT(*) INTO n_rows FROM Book;
    DBMS_OUTPUT.PUT_LINE('Number of rows before INSERT: ' || n_rows);
END;
/