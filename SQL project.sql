##Year wise loan amount Stats
select * from finance_1;
SELECT 
    RIGHT(issue_d, 4) AS year, SUM(loan_amnt) AS total_amount
FROM
    finance_1
GROUP BY 1
ORDER BY 1;

##Grade and sub grade wise revol_bal 
SELECT 
    f1.grade, f1.sub_grade, SUM(f2.revol_bal) AS Sum_revol_bal
FROM
    finance_1 AS f1
        JOIN
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY f1.grade , f1.sub_grade
ORDER BY f1.grade , f1.sub_grade;

##Total Payment for Verified Status Vs Total Payment for Non Verified Status
SELECT 
    f1.verification_status, SUM(f2.total_pymnt) AS total_payment
FROM
    finance_1 AS f1
        JOIN
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY f1.verification_status
HAVING f1.verification_status IN ('Verified' , 'Not Verified');

##State wise and month wise loan status
SELECT 
    addr_state,
    DATE_FORMAT(issue_d, '%Y-%M') AS Month_wise,
    COUNT(*) AS no_of_loan
FROM
    finance_1
GROUP BY addr_state , Month_wise , loan_status
ORDER BY addr_state , Month_wise , loan_status;
																																									
SELECT 
    addr_state,
    MID(issue_d, 6, 2) AS month_wise,
    COUNT(*) AS no_of_loan
FROM
    finance_1
GROUP BY addr_state , month_wise
ORDER BY addr_state , month_wise;

##Home ownership Vs last payment date stats
SELECT 
    f1.home_ownership, COUNT(f2.last_pymnt_d) AS last_pymnt_d
FROM
    finance_1 AS f1
        JOIN
    finance_2 AS f2 ON f1.id = f2.id
GROUP BY home_ownership;






