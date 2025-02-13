with bike_share_info as(
select * from bike_share_yr_0
union all
select * from bike_share_yr_1)

select
bike_share_info.dteday,
bike_share_info.season,
bike_share_info.yr,
bike_share_info.mnth,
bike_share_info.hr,
bike_share_info.holiday,
bike_share_info.weekday,
bike_share_info.workingday,
bike_share_info.weathersit,
bike_share_info.temp,
bike_share_info.atemp,
bike_share_info.hum,
bike_share_info.windspeed,
bike_share_info.rider_type,
bike_share_info.riders,
cost_table.price,
cost_table.COGS,
round(bike_share_info.riders*cost_table.price, 3) as revenue,
round(round(bike_share_info.riders*cost_table.price, 3)-cost_table.COGS,3) as profit
from bike_share_info
left join cost_table on cost_table.yr=bike_share_info.yr;