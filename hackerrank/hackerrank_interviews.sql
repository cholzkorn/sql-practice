-- url: https://www.hackerrank.com/challenges/interviews/problem
select
    contests.contest_id,
    contests.hacker_id,
    contests.name,
    sum(ss.total_submissions),
    sum(ss.total_accepted_submissions),
    sum(vs.total_views),
    sum(vs.total_unique_views)
from contests
inner join colleges on contests.contest_id = colleges.contest_id
inner join challenges on colleges.college_id = challenges.college_id

left join
    (select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views from view_stats group by challenge_id) as vs on vs.challenge_id =  challenges.challenge_id


left join
    (select challenge_id, sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions from submission_stats group by challenge_id) as ss on ss.challenge_id = challenges.challenge_id

group by contests.contest_id, contests.hacker_id, contests.name
having
    sum(ss.total_submissions)!=0 or
    sum(ss.total_accepted_submissions)!=0 or
    sum(vs.total_views)!=0 or
    sum(vs.total_unique_views)!=0
order by contest_id;