CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN ( WITH A AS (
                    SELECT *, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS RANK1
                    FROM EMPLOYEE)
                    
            SELECT SALARY FROM A
            WHERE RANK1 = N
            LIMIT 1
  );
END