-- Creating table projects
CREATE TABLE employment_logs
(
 employment_log_id number(8) GENERATED ALWAYS AS IDENTITY NOT NULL,
 first_name varchar(30),
 last_name varchar(30),
 employment_action varchar(6),
 employment_status_updtd_tmstmp TIMESTAMP,
 CONSTRAINT pk_key PRIMARY KEY (employment_log_id),
 CONSTRAINT ch_emp_act CHECK (employment_action = 'HIRED' or employment_action = 'FIRED')
);

-- Creating procedure for trigger
CREATE OR REPLACE PROCEDURE write_log(n_first_name in varchar, n_last_name in varchar, action in varchar) IS
BEGIN
      INSERT INTO employment_logs (first_name, last_name, employment_action, employment_status_updtd_tmstmp)
      VALUES (n_first_name, n_last_name, action, CURRENT_TIMESTAMP);
END;
/

-- Trigger creating
CREATE OR REPLACE TRIGGER employees_log
AFTER INSERT OR DELETE
 ON employees
 FOR EACH ROW
BEGIN
   IF INSERTING
   THEN

      write_log(:NEW.first_name,:NEW.first_name, 'HIRED');

   ELSIF DELETING
   THEN
      write_log(:OLD.first_name,:OLD.first_name, 'FIRED');
   END IF;

END;
/