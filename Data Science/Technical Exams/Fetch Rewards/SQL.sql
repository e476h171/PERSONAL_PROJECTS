--When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
--When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?  


SELECT RR_STATUS, AVG(TOTAL_SPENT) "AVERAGE SPENT", SUM(PURCHASED_ITEM_CNT) "TOTAL ITEMS PURCHASED"
FROM FET_RECEIPTS
GROUP BY RR_STATUS;

