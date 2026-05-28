CREATE DATABASE TascaAvaluable7_3;
USE TascaAvaluable7_3;

CREATE TABLE employees_xml (
    id INT AUTO_INCREMENT PRIMARY KEY,
    xml_data LONGTEXT NOT NULL,
    description VARCHAR(100)
);

INSERT INTO employees_xml (xml_data, description)
VALUES (LOAD_FILE('C:/MYSQL/LLM/Employees.xml'), 'Employees original');


SELECT 
    ExtractValue(xml_data, 
        '//employee[assigned_branch/assigned_branch_name="Headquarters"]/first_name'
    ) AS nombres_Headquarters
FROM employees_xml;

SELECT 
    ExtractValue(xml_data, 
        'count(//employee[department/department_name="Operations"])'
    ) AS total_empleados_Operations
FROM employees_xml;

SELECT 
    ExtractValue(xml_data, 
        '//employee[superior_emp_id="4"]/first_name'
    ) AS nombres
FROM employees_xml;

SELECT 
    ExtractValue(xml_data, 
        '//employee[@emp_id="7"]/start_date'
    ) AS fecha_inicio_empleado_7
FROM employees_xml;

SELECT 
    ExtractValue(xml_data, 
        '//employee[title="Head Teller"]/assigned_branch/assigned_branch_city'
    ) AS ciudades_Head_Tellers
FROM employees_xml;