-- Adding department_amount column to locations table
ALTER TABLE locations
ADD department_amount number(3,0) DEFAULT 0;

-- Adding comment
COMMENT ON COLUMN locations.department_amount
   IS 'Contains the amount of departments in the location';

-- Trigger creating
CREATE OR REPLACE TRIGGER department_amount_change
AFTER INSERT OR DELETE
 ON departments
 FOR EACH ROW
DECLARE
BEGIN
   IF INSERTING
   THEN
      UPDATE locations
      SET department_amount = department_amount + 1
      WHERE location_id = :NEW.location_id;
   ELSIF DELETING
   THEN
      UPDATE locations
      SET department_amount = department_amount - 1
      WHERE location_id = :OLD.location_id;
   END IF;
END;
/
