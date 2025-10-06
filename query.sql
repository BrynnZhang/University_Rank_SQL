
```basic analysis

select * from university_rankings limit 5;



select distinct year from university_rankings order by year desc;



select institution from university_rankings where country = 'USA' and year = 2014
order by national_rank asc limit 10



select institution, avg(world_rank) as avg_rank from university_rankings
group by institution 
having avg(world_rank)is not null
order by avg_rank asc 
limit 5;


select year, institution, country, score, 
rank() over (partition by year order by score desc) as score_rank
from university_rankings
where country  = 'USA'
order by year desc, score_rank asc
limit 10;





insert into university_rankings (institution, country, year, world_rank, score)
values ('Duke Tech', 'USA', 2014, 350, 60.5)



select count(*) from university_rankings
where year = 2013 and country = 'Japan' and world_rank <= 200;


update university_rankings
set score = score + 1.2
where institution = 'University of Oxford' and year = 2014;

select score from university_rankings
where institution = 'University of Oxford' and year = 2014;





delete from university_rankings
where year = 2015 and score <= 45;