-- TPC-H Query 13

select c_count,
       count(*) as custdist
from (select c_custkey,
             count(o_orderkey) c_count
      from customer
               left outer join orders on
          c_custkey = o_custkey
              and o_comment not like '%special%requests%'
      group by c_custkey) as c_orders
group by c_count