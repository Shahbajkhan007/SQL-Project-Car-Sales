SELECT 
    COUNT(employeeNumber)
FROM
    employees;

SELECT 
    customerNumber
FROM
    payments
WHERE
    amount < (SELECT 
            AVG(amount)
        FROM
            payments);

SELECT 
    customerNumber
FROM
    payments
WHERE
    amount BETWEEN 5000 AND 10000;

SELECT 
    AVG((MSRP - buyPrice) / MSRP) * 100 AS avg_markup_percentage
FROM
    products;

SELECT 
    customerName, city
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL;

SELECT 
    COUNT(*) AS num_cancelled_orders, orderNumber
FROM
    orders
WHERE
    status = 'Cancelled'
GROUP BY orderNumber;
                                 
SELECT 
    COUNT(orderNumber) AS num_of_cancelled_order_and_Order_number
FROM
    orders
WHERE
    status = 'cancelled' 
UNION SELECT 
    orderNumber
FROM
    orders
WHERE
    status = 'cancelled';

SELECT 
    e1.firstname, e1.lastname
FROM
    employees e1
        INNER JOIN
    employees e2 ON e1.employeeNumber = e2.reportsTo
WHERE
    e2.employeeNumber = 1625;
SELECT 
    productName
FROM
    products
WHERE
    productName LIKE '%Ford%';

SELECT 
    c.customerNumber, c.customerName, c.contactLastName, c.phone
FROM
    customers c
        JOIN
    payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
HAVING COUNT(*) % 2 = 1
    AND MAX(p.amount) >= 32077.44
    AND MIN(p.amount) <= 32077.44;

SELECT DISTINCT
    customers.customerName
FROM
    customers
        JOIN
    orders ON customers.customerNumber = orders.customerNumber
WHERE
    orders.status = 'On Hold';

SELECT 
    COUNT(*)
FROM
    customers
WHERE
    country IN ('Denmark' , 'Norway', 'Sweden');

