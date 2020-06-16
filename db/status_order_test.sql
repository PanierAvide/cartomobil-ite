-- Start a transaction.
BEGIN;
SELECT plan(5);

SELECT is(
    status_order_value('yes'),
    1
);

SELECT is(
    status_order_value('limited'),
    2
);

SELECT is(
    status_order_value('unknown'),
    3
);

SELECT is(
    status_order_value('no'),
    4
);

SELECT is(
    status_order_value(''),
    5
);

SELECT * FROM finish();
ROLLBACK;
