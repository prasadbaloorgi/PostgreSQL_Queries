  /* Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
   Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order

  candidates Example Input:
candidate_id	skill
123	          Python
123	          Tableau
123	          PostgreSQL
234	          R
234	          PowerBI
234	          SQL Server
345	          Python
345	          Tableau

Example Output:
candidate_id
123
*/

with CTE AS
(
SELECT
candidate_id,
MAX(CASE WHEN skill='Python' then skill else NULL end) as skill1,
MAX(CASE WHEN skill='Tableau' then skill else NULL end) as skill2,
MAX(CASE WHEN skill='PostgreSQL' then skill else NULL end) as skill3
FROM
candidates
GROUP BY
candidate_id
)

SELECT candidate_id 
FROM CTE 
WHERE skill1 = 'Python' 
    AND skill2 = 'Tableau' 
    AND skill3 = 'PostgreSQL'
ORDER BY 1;

