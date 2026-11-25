SELECT status, COUNT(*) AS memberships_count
FROM memberships
GROUP BY status;

SELECT payment_method, COUNT(*) AS payments_count, SUM(amount) AS total_amount
FROM membership_payments
GROUP BY payment_method
ORDER BY total_amount DESC;

SELECT member_id, COUNT(*) AS visits_count
FROM attendance
GROUP BY member_id
HAVING COUNT(*) >= 1
ORDER BY visits_count DESC;

SELECT AVG(price) AS avg_membership_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM membership_types;