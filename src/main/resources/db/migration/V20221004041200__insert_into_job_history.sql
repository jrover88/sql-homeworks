INSERT INTO regions(region_id, region_name)
VALUES (1, 'Europe');

INSERT INTO countries(country_id, country_name, region_id)
VALUES (1, 'Germany', 1);

INSERT INTO locations(location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1, 'Stivic Cel Mare 15', '2020', 'Frankfurt','Gessen', 1);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES (10, 'Marketing', 1000, 1500);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (13, 'Marketing', null, 1);

INSERT INTO employees(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
                    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES (1, 'Steven', 'King', 'google@gmail.com', '373.69951425', add_months(current_timestamp,-2), 10, 1500, null, null, 13);
INSERT INTO employees(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,
                    HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES (2, 'Jora', 'Teplii', 'jora_gde_ti_bil@gmail.com', '373.69911111', add_months(current_timestamp,-1), 10, 1000, null, 1, 13);

INSERT INTO job_history(employee_id, start_date, end_date, job_id, department_id)
VALUES (2, add_months(current_timestamp,-10), add_months(current_timestamp,-2), 10, 13);
