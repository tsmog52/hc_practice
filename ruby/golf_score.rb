x = nil
y = nil

File.open("case_2.txt") do |f|
  x = f.gets.chomp.split(',').map(&:to_i)
  y = f.gets.chomp.split(',').map(&:to_i)
end

score = []

# SCORE_MAPPINGを定義
SCORE_MAPPING = {
  -4 => "コンドル",
  -3 => "アルバトロス",
  -2 => "イーグル",
  -1 => "バーディ",
  0 => "パー",
  1 => "ボギー",
}

# 先にホールインワンと2ボギー以上をif文で分岐して、それ以外は、SCORE_MAPPINGを呼び出す
def calculate_scores(x, y)
  SCORE_MAPPING[y - x]
end

x.zip(y).each do |x, y|
  if y == 1 && x != 5
    score << "ホールインワン"
  elsif y - x >= 2
    score << "#{y - x}ボギー"
  else
    score << calculate_scores(x, y)
  end
end

puts score.join(",")
