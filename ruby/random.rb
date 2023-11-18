# メンバーをグループ分けする
group = %w[A B C D E F]

# グループを2,3,4人のランダムに分け、アルファベット順にする
group1 = group.sample([2, 3, 4].sample).sort

# 全体からグループ1を引いてグループ2を作る 
group2 = group - group1

# 結果を表示
p group1
p group2  
