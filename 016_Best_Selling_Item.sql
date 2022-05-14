select invoicedate,description,unitprice*quantity as Invoice_amt from 
(select *,rank()over(partition by Month(invoicedate) order by (unitprice*quantity) desc) as rnk
from online_retail)tbl
where rnk=1
