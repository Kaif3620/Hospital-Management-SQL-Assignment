create table hospital(
		Hospital_Name varchar(50),
		Location varchar(50),
		Department varchar(50),
		Doctors_Count int,
		Patients_Count int,
		Admission_Date date,
		Discharge_Date date,
		Medical_Expenses numeric(10,2) 
);

select * from hospital;


--1.	Total Number of Patients.	
--Write an SQL query to find the total number of patients across all hospitals. 

SELECT
	SUM(PATIENTS_COUNT) AS TOTAL_NUMBER_OF_PATIENTS
FROM
	HOSPITAL;


--2.	Average Number of Doctors per Hospital.
--Retrieve the average count of doctors available in each hospital. 

SELECT
	HOSPITAL_NAME,
	AVG(DOCTORS_COUNT) AS AVGERAGE_DOCTOR
FROM
	HOSPITAL
GROUP BY
	HOSPITAL_NAME;


--3.	Top 3 Departments with the Highest Number of Patients.	
--Find the top 3 hospital departments that have the highest number of patients. 

SELECT
	DEPARTMENT,
	SUM(PATIENTS_COUNT)
FROM
	HOSPITAL
GROUP BY
	DEPARTMENT
ORDER BY
	SUM(PATIENTS_COUNT) DESC LIMIT
	3;


--4.	Hospital with the Maximum Medical Expenses.	
--Identify the hospital that recorded the highest medical expenses. 

SELECT
	HOSPITAL_NAME,
	MEDICAL_EXPENSES
FROM
	HOSPITAL
ORDER BY
	MEDICAL_EXPENSES DESC LIMIT
	1;


--5.	Daily Average Medical Expenses.
--Calculate the average medical expenses per day for each hospital. 

SELECT
	HOSPITAL_NAME,
	(
		MEDICAL_EXPENSES / (DISCHARGE_DATE - ADMISSION_DATE)
	) AS AVG_PER_DAY FROM
	HOSPITAL;


--6.	Longest Hospital Stay.
--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

SELECT
	HOSPITAL_NAME,
	(DISCHARGE_DATE - ADMISSION_DATE) AS STAY
FROM
	HOSPITAL
ORDER BY
	STAY DESC LIMIT
	1;


--7.	Total Patients Treated Per City.	
--Count the total number of patients treated in each city. 

select * from hospital;

SELECT
	LOCATION,
	SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM
	HOSPITAL
GROUP BY
	LOCATION;
	

--8.	Average Length of Stay Per Department.	
--Calculate the average number of days patients spend in each department. 

SELECT
	DEPARTMENT,
	AVG(DISCHARGE_DATE - ADMISSION_DATE) AS STAY
FROM
	HOSPITAL
GROUP BY
	DEPARTMENT;
	

--9.	Identify the Department with the Lowest Number of Patients.	
--Find the department with the least number of patients. 

SELECT
	DEPARTMENT,
	SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM
	HOSPITAL
GROUP BY
	DEPARTMENT
ORDER BY
	TOTAL_PATIENTS ASC LIMIT
	1;

--10.	Monthly Medical Expenses Report.
--Group the data by month and calculate the total medical expenses for each month. 

SELECT
	EXTRACT(
		MONTH
		FROM
			ADMISSION_DATE
	) AS AD_MONTH,
	SUM(MEDICAL_EXPENSES) AS TOTAL_ESPENSES
FROM
	HOSPITAL
GROUP BY
	AD_MONTH ORDER BY
	AD_MONTH;

