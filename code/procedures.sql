create or replace PROCEDURE book_sales_summary AS
BEGIN
    FOR row IN (SELECT b.title, SUM(oi.quantity) AS total_sales
                FROM Book b
                JOIN Order_Item oi ON b.book_id = oi.book_id
                GROUP BY b.title) LOOP
        DBMS_OUTPUT.PUT_LINE('Title: ' || row.title || ', Total Sales: ' || row.total_sales);
    END LOOP;
END;
/


create or replace PROCEDURE delete_book(p_book_id IN NUMBER) AS
BEGIN
    DELETE FROM Book WHERE book_id = p_book_id;
    DBMS_OUTPUT.PUT_LINE('Deleted Rows: ' || SQL%ROWCOUNT);
END;
/

create or replace PROCEDURE insert_book(
    p_book_id IN NUMBER,
    p_title IN VARCHAR2,
    p_price IN NUMBER,
    p_stock IN INTEGER,
    p_author_id IN NUMBER,
    p_publisher_id IN NUMBER
) AS
    title_too_short EXCEPTION;
BEGIN
    IF LENGTH(p_title) < 5 THEN
        RAISE title_too_short;
    ELSE
        INSERT INTO Book (book_id, title, price, stock, author_id, publisher_id)
        VALUES (p_book_id, p_title, p_price, p_stock, p_author_id, p_publisher_id);
    END IF;

    EXCEPTION
        WHEN title_too_short THEN
            DBMS_OUTPUT.PUT_LINE('Error: The title must have at least 5 characters.');
END;
/