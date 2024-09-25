-- 175
-- https://leetcode.cn/problems/combine-two-tables/description/
select firstName,lastName,city,state
from Person p
left join Address a
on p.personId = a.personId
;

-- 181
-- https://leetcode.cn/problems/employees-earning-more-than-their-managers/description/
select e.name as Employee
from Employee e
left join Employee m
on e.managerId=m.id
where e.salary > m.salary
;

-- 182
-- https://leetcode.cn/problems/duplicate-emails/description/
select email
from Person
group by 1
having count(email) >1
;

-- 183
-- https://leetcode.cn/problems/customers-who-never-order/description/
select c.name as Customers
from Customers c
left join Orders o
on o.customerId=c.id
where o.customerId is null
;

-- 196
-- https://leetcode.cn/problems/delete-duplicate-emails/description/
with dep as (
    select email,min(id) mid,count(email) c
    from Person
    group by email
)
delete from Person where id not in ( select mid from dep)
;

-- 197
-- https://leetcode.cn/problems/rising-temperature/description/
select t.id
from Weather t
left join Weather y
on DATE_SUB(t.recordDate, interval 1 day) = y.recordDate
where t.temperature > y.temperature
;

-- 511
-- https://leetcode.cn/problems/game-play-analysis-i/description/
select player_id,min(event_date) as first_login
from Activity
group by 1
;

-- 577
-- https://leetcode.cn/problems/employee-bonus/description/
select name,bonus
from Employee e
left join Bonus b
on e.empId=b.empId
where bonus<1000 or bonus is null
;

-- 584
-- https://leetcode.cn/problems/find-customer-referee/description/
select name
from Customer
where referee_id != 2 or referee_id is null
;

-- 586
-- https://leetcode.cn/problems/customer-placing-the-largest-number-of-orders/description/
select customer_number
from Orders
group by customer_number
order by count(1) desc
limit 1
;

-- 595
-- https://leetcode.cn/problems/big-countries/description/
select name,population,area
from World
where area >= 3000000
or population >= 25000000
;

-- 596
-- https://leetcode.cn/problems/classes-more-than-5-students/description/
select class
from Courses
group by class
having count(1) >=5
;

-- 607
-- https://leetcode.cn/problems/sales-person/description/
select name
from SalesPerson
where sales_id not in (
    select sales_id
    from Orders a
    left join Company b
    on a.com_id=b.com_id
    where b.name ='RED'
)
;

-- 610
-- https://leetcode.cn/problems/triangle-judgement/description/
-- 判断三个线段能否组成‌三角形的核心条件是：任意两边之和大于第三边，且任意两边之差小于第三边‌
select a.*
, case when ( x+y>z and x+z>y and y+z>x and x-y<z and x-z<y and y-z<x   ) then 'Yes' else 'No' end as triangle
from Triangle a
;

-- 619
-- https://leetcode.cn/problems/biggest-single-number/description/
select max(num) as num
from (
    select num
    from MyNumbers
    group by 1
    having count(1)=1
) tmp
;

-- 620
-- https://leetcode.cn/problems/not-boring-movies/description/
select *
from cinema
where description !='boring'
and MOD(id,2)=1
order by rating desc
;

-- 627
-- https://leetcode.cn/problems/swap-salary/description/
update salary
set sex = case sex when 'm' then 'f' else 'm' end
;

-- 1050
-- https://leetcode.cn/problems/actors-and-directors-who-cooperated-at-least-three-times/description/
select actor_id,director_id
from ActorDirector
group by actor_id,director_id
having count(1) >=3
;

-- 1068
-- https://leetcode.cn/problems/product-sales-analysis-i/description/
select b.product_name,a.year,a.price
from Sales a
left join Product b
on a.product_id=b.product_id
;
