# University_Rank_SQL

### Basic Inspection 

##### Choose the first 5 rows from the table: 
```
select * from university_rankings limit 5;
```


##### See data from which years is being collected: 
```
select distinct year from university_rankings order by year desc;
```
This show the data is collected from 2015, 2014, 2013, and 2012


##### Top 10 universities in USA in 2014: 
```
select institution from university_rankings 
where country = 'USA' and year = 2014
order by national_rank asc limit 10
```
The top 10 USA universities in 2014 are Harvard, Stanford, MIT, Columbia, UCB, Chicago, Princeton, Yale, Cornell, and CalTech. 



##### Universities that are in top 5 highest average rank across years
```
select institution, avg(world_rank) as avg_rank from university_rankings
group by institution 
having avg(world_rank)is not null
order by avg_rank asc 
limit 5;
```
The top five universities with highest rank are: Harvard, Stanford, MIT, Cambridge, and Oxford.


##### Which USA universities have the highest scores each year, and rank them globally within that year based on their score
```
select year, institution, country, score, 
rank() over (partition by year order by score desc) as score_rank
from university_rankings
where country  = 'USA'
order by year desc, score_rank asc
limit 10;
```
The rank shows: 1. Harvard, 2. Stanford, 3. MIT, 4.Columbia, 5. UCB, 6. Chicago, 7. Princeton, 8. Cornell, 9. Yale, 10. CalTech






### Manipulation



##### The ranking committee has decided to publish new results for a new university in 2014. Insert this university into the database: 
Institution: Duke Tech
Country: USA
World Rank: 350
Score: 60.5
```
insert into university_rankings (institution, country, year, world_rank, score)
values ('Duke Tech', 'USA', 2014, 350, 60.5)
```
The database is added by one more row where under the institution shows Duke Tech, country column shows USA, year column shows 2014, world_rank column shows 350, score shows 60.5, and the rest of the columns show NULL.




##### A policy consultant has reached out to you with the following question. How many universities from Japan show up in the global top 200 in 2013: 
```
select count(*) from university_rankings
where year = 2013 and country = 'Japan' and national_rank <= 200;
```
This shows that there are 6 univeristies from Japan show up in the global top 200 in 2013.




##### The score for University of Oxford in 2014 was miscalculated. Increase its score by +1.2 points. Update the row to reflect this update
```
update university_rankings
set score = score + 1.2
where institution = 'University of Oxford' and year = 2014;
```
This changed the score of Oxford in 2014 from 97.51 to 98.71.



##### After reviewing, the ranking committee decided that universities with a score below 45 in 2015 should not have been included in the published dataset. Clean up the records to reflect this 
```
delete from university_rankings
where year = 2015 and score <= 45;
```
This deleted all the rows with score lower than 45 in year 2015. 