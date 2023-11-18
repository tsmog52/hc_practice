#テキストファイルを受け取る
x = nil
y = nil

File.open("case_1.txt") do |f|
  x = f.gets.chomp.split(',').map(&:to_i)
  y = f.gets.chomp.split(',').map(&:to_i)
end

# #配列の用意
score = []

# # xとyの値から差分を求める
x.zip(y).each do |x, y|
  case
  when y == 1 &&  !(x == 5)
    score << "ホールインワン"
  when y - x == 0 
    score << "パー" 
  when y - x == 1
    score << "ボギー"
  when y - x == -1
    score << "バーディー"
  when y - x == -2
    score << "イーグル"
  when y - x == -3
    score << "アルバトロス"
  when y - x == -4
    score << "コンドル"
  else 
    score << "#{y - x}ボギー"
  end
end

puts score.join(",")



