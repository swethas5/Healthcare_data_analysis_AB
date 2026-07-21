---Source files uploaded to online free CSV uploader and SQL Editor - CSVFiddle.
--- Checked for null member ids in the files using SQL queries in both members and claims table.
---- Claim Type Cost Breakdown

with claim_summary as
(select claim_type, count(*) as number_of_claims, sum(paid_amount) as total_paid_amount,
sum(billed_amount) as total_billed_amount
from claims
group by claim_type)
select claim_type, number_of_claims, total_paid_amount,
total_billed_amount ,dense_rank() over(order by total_paid_amount desc) as Ranking
from claim_summary;
