SELECT TOP (1000) [Census Division_and State],
      [Residential April 2024 YTD]
      ,[Residential April 2023 YTD]
      ,[Commercial April 2024 YTD]
      ,[Commercial April 2023 YTD]
      ,[Industrial April 2024 YTD]
      ,[Industrial April 2023 YTD]
      ,[Transportation April 2024 YTD]
      ,[Transportation April 2023 YTD]
      ,[All sectors April 2024 YTD]
      ,[All Sectors April 2023 YTD]
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$]

  --Ranking of States with Residential Sales in 2023 & 2024 
  select top 10 [Census Division_and State],[Residential April 2024 YTD],
  RANK() over(order by [Residential April 2024 YTD] desc) as R_2024_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State] NOT IN ('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain')

  select top 10 [Census Division_and State],[Residential April 2023 YTD],
    RANK() over(order by [Residential April 2023 YTD] desc) as R_2023_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State] NOT IN ('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain')



  --% States Commercial sector sales ranking in 2024

  select [Census Division_and State],[Commercial April 2024 YTD],
  RANK() over(order by [Commercial April 2024 YTD] desc) as R_2024_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State]<>'U.S. Total' 
   --% States Commercial sector sales ranking in 2023
select  [Census Division_and State],[Commercial April 2023 YTD], 
RANK() over(order by [Commercial April 2023 YTD] desc) as R_2023_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State]<>'U.S. Total' 


  --% States Industrial sector sales ranking in 2024

  select [Census Division_and State],[Industrial April 2024 YTD],
  RANK() over(order by [Industrial April 2024 YTD] desc) as R_2024_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State]<>'U.S. Total' 
   --% States Commercial sector sales ranking in 2023
select  [Census Division_and State],[Industrial April 2023 YTD], 
RANK() over(order by [Industrial April 2023 YTD] desc) as R_2023_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State]<>'U.S. Total' 

  --% States Transportation sector sales ranking in 2024

  select [Census Division_and State],[Transportation April 2024 YTD],
  RANK() over(order by [Transportation April 2024 YTD] desc) as R_2024_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State]<>'U.S. Total' 
   --% States Commercial sector sales ranking in 2023
select [Census Division_and State],[Transportation April 2023 YTD], 
RANK() over(order by [Transportation April 2023 YTD] desc) as R_2023_Rank
  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  where [Census Division_and State]<>'U.S. Total' 






--Sales% change from 2023 to 2024 
  select [Census Division_and State],(([Commercial April 2024 YTD]-[Commercial April 2023 YTD])/[Commercial April 2023 YTD]*100) as Commercial_Sales_Change,
  (([Residential April 2024 YTD]-[Residential April 2023 YTD])/[Residential April 2023 YTD]*100) as Residential_Sales_Change,
  (([Industrial April 2024 YTD]-[Industrial April 2023 YTD])/[Industrial April 2023 YTD]*100) as Industrial_Sales_Change,
  (([Transportation April 2024 YTD]-[Transportation April 2023 YTD])/[Transportation April 2023 YTD]*100) as Transportation_Sales_Change  

  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
  
  where [Transportation April 2024 YTD]<>0 AND [Transportation April 2024 YTD]<>0
 -- group by [Census Division_and State] 


  select * from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$]

--Highest Census Sales for all states in 2024 for all sectors 
select top 10 [Census Division_and State],Max([Residential April 2024 YTD]) over(partition by [Census Division_and State] order by [Residential April 2024 YTD] desc) as Top_10_Resi_State_Sales,
Max([Commercial April 2024 YTD]) over(partition by [Census Division_and State] order by [Commercial April 2024 YTD] desc) as Top_10_Comm_State_Sales,
Max([Industrial April 2024 YTD]) over(partition by [Census Division_and State] order by [Industrial April 2024 YTD] desc) as Top_10_Indus_State_Sales,
Max([Transportation April 2024 YTD]) over(partition by [Census Division_and State] order by [Transportation April 2024 YTD] desc) as Top_10_Transp_State_Sales
from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
where [Census Division_and State] IN('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain')


  --Highest Census Sales for all states in 2023 for all sectors 
select top 10 [Census Division_and State],Max([Residential April 2023 YTD]) over(partition by [Census Division_and State] order by [Residential April 2023 YTD] desc) as Top_10_Resi_State_Sales,
Max([Commercial April 2023 YTD]) over(partition by [Census Division_and State] order by [Commercial April 2023 YTD] desc) as Top_10_Comm_State_Sales,
Max([Industrial April 2023 YTD]) over(partition by [Census Division_and State] order by [Industrial April 2023 YTD] desc) as Top_10_Indus_State_Sales,
Max([Transportation April 2023 YTD]) over(partition by [Census Division_and State] order by [Transportation April 2023 YTD] desc) as Top_10_Transp_State_Sales
from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
where [Census Division_and State] IN('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain')

select top 10 [Census Division_and State],Max([Residential April 2023 YTD]) over(partition by [Census Division_and State] order by [Residential April 2023 YTD] desc) as Top_10__2023_Resi_State_Sales,
Max([Commercial April 2023 YTD]) over(partition by [Census Division_and State] order by [Commercial April 2023 YTD] desc) as Top_10_2023_Comm_State_Sales,
Max([Industrial April 2023 YTD]) over(partition by [Census Division_and State] order by [Industrial April 2023 YTD] desc) as Top_10_2023_Indus_State_Sales,
Max([Transportation April 2023 YTD]) over(partition by [Census Division_and State] order by [Transportation April 2023 YTD] desc) as Top_10_2023_Transp_State_Sales
from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
where [Census Division_and State] IN('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain')


--	Which Census Sales have incresed by 50% in 2024 in all 3 sectors 

select [Census Division_and State],(([Commercial April 2024 YTD]-[Commercial April 2023 YTD])/[Commercial April 2023 YTD]*100) as Commercial_Sales_Change,
  (([Residential April 2024 YTD]-[Residential April 2023 YTD])/[Residential April 2023 YTD]*100) as Residential_Sales_Change,
  (([Industrial April 2024 YTD]-[Industrial April 2023 YTD])/[Industrial April 2023 YTD]*100) as Industrial_Sales_Change,
  (([Transportation April 2024 YTD]-[Transportation April 2023 YTD])/[Transportation April 2023 YTD]*100) as Transportation_Sales_Change  

  FROM [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 

 
  
  where [Transportation April 2024 YTD]<>0 AND [Transportation April 2023 YTD]<>0 AND 
  [Census Division_and State]NOT IN('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain')
  


 select * from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 

 -- Total sales in all secors in states  excepts the regions
 select top 10 [Census Division_and State], SUM([Residential April 2024 YTD]) over(partition by [Census Division_and State] order by [Residential April 2024 YTD] desc) as Total_Resi_Sales,
 SUM([Commercial April 2024 YTD]) over(partition by [Census Division_and State] order by [Commercial April 2024 YTD] desc) as Total_Comm_Sales,
 SUM([Industrial April 2024 YTD]) over(partition by [Census Division_and State] order by [Industrial April 2024 YTD] desc) as Total_Indus_Sales,
 SUM([Transportation April 2024 YTD]) over(partition by [Census Division_and State] order by [Transportation April 2024 YTD] desc) as Total_Trans_Sales
 from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
 where  [Census Division_and State] NOT IN ('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain') 
 


 -- AVG sale per each sector 
 select top 1 Avg([Residential April 2024 YTD]) over(partition by [Census Division_and State] order by [Residential April 2024 YTD] desc) as Avg__2024_Residentail_Sales,
 Avg([Residential April 2023 YTD]) over(partition by [Census Division_and State] order by [Residential April 2023 YTD] desc) as Avg_2023_Residential_Sales,
 Avg([Commercial April 2024 YTD]) over(partition by [Census Division_and State] order by [Commercial April 2024 YTD] desc) as Avg__2024_Commercial_Sales,
 Avg([Commercial April 2023 YTD]) over(partition by [Census Division_and State] order by [Commercial April 2023 YTD] desc) as Avg_2023_Commercial_Sales,
  Avg([Industrial April 2024 YTD]) over(partition by [Census Division_and State] order by [Industrial April 2024 YTD] desc) as Avg__2024_Industrial_Sales,
 Avg([Industrial April 2023 YTD]) over(partition by [Census Division_and State] order by [Industrial April 2023 YTD] desc) as Avg_2023_Industrial_Sales,
 Avg([Transportation April 2024 YTD]) over(partition by [Census Division_and State] order by [Transportation April 2024 YTD] desc) as Avg__2024_Transportation_Sales,
 Avg([Transportation April 2023 YTD]) over(partition by [Census Division_and State] order by [Transportation April 2023 YTD] desc) as Avg_2023_Transportation_Sales
  from [USA_Electricity_Sales].[dbo].[USA Sales 2023-2024$] 
 where  [Census Division_and State] NOT IN ('U.S. Total','East North Central', 'New England','East Noth Central','West North Central',
  'East South Central','West South Central','Pacific Noncontiguous','South Atlantic','Pacific Contiguous','Middle Atlantic','Mountain') 

Year to year Revenue & Sales growth for Resudnetial Sector of Electricity Sales 
with Info 
as 
(
select Year,State,Residential_Revenue as Current_Year_Revenue, LAG(Residential_Revenue) over(partition by State order by Year DESC) as Prev_Year_Revenue,
[Residential_Sales(Megawatthours)] as Current_Year_Sales,LAG([Residential_Sales(Megawatthours)]) over(partition by State order by Year DESC) as Prev_Year_Residential_Sales
from [USA_Electricity_Sales].[dbo].['State-YTD-States$']
where State IN('TX','CA','NY','FL','PA','IL','GA')
)
--year to year growth in revenue
 select Year,State,Current_Year_Revenue,Prev_Year_Revenue,(100*(Current_Year_Revenue-Prev_Year_Revenue)/Prev_Year_Revenue) as Year_To_Year_Revenue_Growth,Current_Year_Sales,Prev_Year_Residential_Sales,(100*(Current_Year_Sales-Prev_Year_Residential_Sales)/Prev_Year_Residential_Sales) as Year_To_Year_Sales_Growth
 from Info
--query for cummulative month sales
SELECT TOP (1000) [Year]
      ,[Months]
      ,[State]
      ,[Revenue_Sales-Megawatthours],sum([Revenue_Sales-Megawatthours]) over(order by Months) as Cummulative_Month_Sales
	 
    
  FROM [US_electricity_sales_revenue].[dbo].['Monthly-States$']

where State='NC'  and Year=2023
 
