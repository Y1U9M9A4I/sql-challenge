-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" VARCHAR(20)   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" VARCHAR(20)   NOT NULL,
    PRIMARY KEY (emp_no)
);

SELECT * FROM employees; 

CREATE TABLE "department" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE "dep_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
	PRIMARY KEY (emp_no)
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

CREATE TABLE "salaries" (
    "id" SERIAL   NOT NULL,
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id")
);

SELECT * FROM titles;

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("id");

ALTER TABLE "department" ADD CONSTRAINT "fk_department_id" FOREIGN KEY("id")
REFERENCES "dept_emp" ("id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("id");

ALTER TABLE "dep_manager" ADD CONSTRAINT "fk_dep_manager_id" FOREIGN KEY("id")
REFERENCES "department" ("id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_id" FOREIGN KEY("id")
REFERENCES "employees" ("id");
