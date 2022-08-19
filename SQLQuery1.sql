SELECT s.[sid],s.sname,sl.saname,sl.salary,s.nvname,ISNULL(wt.tid,-1)tid,wt.checkin,wt.checkout, ws.wname ,
isnull (sm.advance_salary,0)advance_salary,isnull (sm.bonus_salary,0)bonus_salary,isnull (sm.deduction_salary,0)deduction_salary,
work_minutes  =  DATEDIFF (  MI , [checkin] , [checkout] ) - ws.time_work*60
from Salary  sl inner join Salary_management sm
on sl.said=sm.said inner join Staff s
on sm.[sid]= s.[sid] 
   LEFT JOIN (SELECT * FROM WorkingTime WHERE
   	checkin >= '2022-08-01 06:30:33.300'
   	AND
      checkin < '2022-09-30 06:30:33.300') wt 
   	ON s.[sid] = wt.[sid] INNER JOIN Work_shift ws
ON wt.wid=ws.wid
order by checkin


	select s.sname ,s.nvname,sl.saname,sl.salary,wt.checkin,wt.checkout,
ws.wname,
work_minutes  =  DATEDIFF (  MI , [checkin] , [checkout] ) - ws.time_work*60
from Salary  sl inner join Salary_management sm
on sl.said=sm.said inner join Staff s
on sm.[sid]= s.[sid] inner  join WorkingTime wt
on s.[sid]= wt.[sid] left join Work_shift ws
on wt.wid=ws.wid
where s.[sid] ='1'
order by checkin
