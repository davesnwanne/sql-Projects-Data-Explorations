---- CORROLLEATED SUBQUERY IN WHERE CLAUSE---
--- SUBQUERY GETS EVALUATED FOR EVERY SINGLE ROW---
---SHOW ONLY PAYMENTS THAT HAVE THE HIGHEST AMOUNT PER CUSTOMER.
SELECT *FROM PAYMENT P1
WHERE AMOUNT=(SELECT MAX(AMOUNT)FROM PAYMENT P2
			 WHERE P1.CUSTOMER_ID=P2.CUSTOMER_ID)
ORDER BY CUSTOMER_ID
--SHOW MOVIES AND TITLES ,THEIR ASSOCIATED FILM_ID AND REPLACEMENT COST WITH LOWEST REPLACEMENT_COSTS FOR IN EACH RATING
SELECT TITLE,FILM_ID,REPLACEMENT_COST,RATING
FROM FILM F1
WHERE REPLACEMENT_COST=
(SELECT MIN(REPLACEMENT_COST)FROM FILM F2
WHERE F1.RATING=F2.RATING)
---
SELECT TITLE,FILM_ID,REPLACEMENT_COST,RATING
FROM FILM F1
WHERE LENGTH=
(SELECT MAX(LENGTH) FROM FILM F2
WHERE F1.RATING=F2.RATING)
---CORELLATED SUBQUERIES IN SELECT CLAUSE---
---SHOW MAX AMOUNT FOR EVERY CUSTOMER--
SELECT *,
(SELECT MAX(AMOUNT)FROM PAYMENT P2
WHERE P1.CUSTOMER_ID=P2.CUSTOMER_ID)
FROM PAYMENT P1
ORDER BY CUSTOMER_ID
----- CORRELATED PROJECTS--
SELECT 
PAYMENT_ID,
CUSTOMER_ID,
STAFF_ID,AMOUNT,
(SELECT SUM(AMOUNT)AS SUM_AMOUNT
FROM PAYMENT P2
WHERE P1.CUSTOMER_ID=P2.CUSTOMER_ID),
(SELECT COUNT(AMOUNT)AS COUNT_PAYMENTS
FROM PAYMENT P2
WHERE P1.CUSTOMER_ID=P2.CUSTOMER_ID)
FROM PAYMENT P1
ORDER BY CUSTOMER_ID, AMOUNT DESC

----SHOW HIGHEST REPLACEMENT COST FOR EACH RATING--
SELECT TITLE, REPLACEMENT_COST,RATING,
(SELECT AVG(REPLACEMENT_COST)FROM FILM F2
  WHERE F1.RATING=F2.RATING)
  
FROM FILM F1
WHERE REPLACEMENT_COST=(SELECT MAX(REPLACEMENT_COST)FROM FILM F3
         WHERE F1.RATING=F3.RATING)
		 
---SHOW THE TOPMPAYMENTS FOR EACH CUSTOMER INCLUDING 
SELECT FIRST_NAME, AMOUNT, PAYMENT_ID
FROM PAYMENT P1
INNER JOIN CUSTOMER C
ON P1.CUSTOMER_ID=C.CUSTOMER_ID
WHERE AMOUNT= (SELECT MAX(AMOUNT)FROM PAYMENT P2
			  WHERE P1.CUSTOMER_ID=P2.CUSTOMER_ID)

