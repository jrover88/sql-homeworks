-- Creating table projects with a many-to-many relation to employees
CREATE TABLE projects
(
 project_id number(10) NOT NULL PRIMARY KEY,
 project_description varchar(255),
 project_investments number(8, -3),
 project_revenue number(8),
 CONSTRAINT project_investments_positive
 CHECK (project_investments >= 0)
);


CREATE TABLE projects_employees_hours
(
 project_id number(10) REFERENCES projects(project_id),
 employee_id number(6,0)REFERENCES employees(employee_id),
 hour number(4, 2)
);