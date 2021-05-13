#!/usr/bin/env ruby

require 'date'
require 'optparse'
require 'paint'
  this_year = Date.today.year
  this_month = Date.today.month
  today = Date.today.day
  params = ARGV.getopts("", "y:#{this_year}", "m:#{this_month}")
  y = params["y"].to_i
  m = params["m"].to_i

if y > 9999 || y < 1
  print("cal: year `#{y}' not in range 1..9999")
  exit
end

if m > 12 || m < 1
  print("cal: #{m} is neither a month number (1..12) nor a name")
  exit
end

  month_start = Date.new(y,m,1)
  month_end = Date.new(y,m,-1)
  print("      ",m,"月 ",y,"\n")
  print("日 月 火 水 木 金 土","\n")
  print("   " * month_start.wday)

(1..31).each do |day|
  break if day == month_end.day + 1
  if [day,y,m] == [today,this_year,this_month]
    print(Paint[today.to_s.rjust(2),:inverse],(" "))
  else
    print(day.to_s.rjust(2),(" "))
  end
  print("\n") if (month_start.wday + day) % 7 == 0
end
  print("\n") if (month_start.wday + month_end.day) % 7 != 0

