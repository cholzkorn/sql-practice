SELECT customer$.customer_id, customer$.cname,
COUNT(transactions$.transaction_id) AS no_transactions
FROM customer, transactions
LEFT JOIN customer.customer_id ON customer.customer_id = transactions.customer_id
GROUP by customer.customer_id