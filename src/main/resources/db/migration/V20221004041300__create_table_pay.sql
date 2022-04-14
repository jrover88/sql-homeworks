
CREATE TABLE pay
(
 card_nr number(16, 0) NOT NULL,
 salary number(8, 2),
 commission_pct number(2, 2),
 CONSTRAINT cards_pk PRIMARY KEY (card_nr)
);

ALTER TABLE employees
ADD card_nr number(16, 0) REFERENCES pay(card_nr);