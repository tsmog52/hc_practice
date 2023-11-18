require 'date'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('-m month', Integer) { |v| options[:month] = v}
  opt.parse!(ARGV)
end 

year = Date.today.year
month = options[:month] || Date.today.month  

if (1..12).include?(month)
  puts "#{month}月 #{year}年".center(20)

  first_day = Date.new(year, month, 1) #初日の取得
  last_day = Date.new(year, month, -1) #最終日の取得

  puts "月 火 水 木 金 土 日" #曜日の取得
  print "   " * ((first_day.wday + 6) % 7) #初日のスペース

  (first_day..last_day).each do |d|
    print d.day.to_s.rjust(2)  #右寄せで表示
    print " "
    puts "\n" if d.sunday?
  end
  puts ''
else
  puts "#{month} is neither a month number (1..12) nor a name"
end

