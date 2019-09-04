SELECT customer$.customer_id, customer$.cname, SUM(transactions$.price) AS "money_spent"
INTO bestCustomers
FROM transactions$
LEFT JOIN customer$ ON customer$.customer_id=transactions$.customer_id
GROUP BY customer$.customer_id, customer$.cname
HAVING SUM(transactions$.price) > 100