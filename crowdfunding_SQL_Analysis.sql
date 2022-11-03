-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

select backers_count, cf_id
from campaign
where outcome = 'live'
order by backers_count desc ;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select cf_id, count(backer_id) as backers_count
from backers
group by cf_id
order by backers_count desc;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

select c.first_name, c.last_name, c.email, (ca.goal - ca.pledged) AS "Remaining Goal Amount"
into email_contacts_remaining_goal_amount
from contacts as c
join campaign as ca
on ca.contact_id = c.contact_id
where ca.outcome = 'live' 
order by "Remaining Goal Amount" desc;



-- Check the table
select *
from email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
-- Based off instructions
select b.email,
b.first_name,
b.last_name,
b.cf_id,
ca.company_name,
ca.description,
ca.end_date,
(ca.goal- ca.pledged) as "Left of Goal"
--into email_backers_remaining_goal_amount
from backers as b 
Join campaign as ca
on ca.cf_id = b.cf_id
where ca.outcome = 'live'
order by b.email desc;

---Based off image provided
SELECT b.email,
b.first_name,
b.last_name,
ca.cf_id,
ca.company_name,
ca.description,
ca.end_date,
 (ca.goal-ca.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers as b
JOIN campaign as ca
ON ca.cf_id = b.cf_id
WHERE ca.outcome = 'live'
ORDER BY b.last_name, b.first_name;


-- Check the table

select *
from email_backers_remaining_goal_amount;
