#===========メソッドたち===========

def battle_jyanken(call) #じゃんけんメソッド
  def convert(number) #じゃんけん内のメソッド：変換
    case number
      when 0
        return "グー"
      when 1
        return "チョキ"
      when 2
        return "パー"
      when 3
        puts "なぜ戦わない"
        exit
      else
        puts "どれかにしてください！"
        exit
    end
  end

  def janken(input, enemy) #じゃんけん内のメソッド：条件分岐
    if input == enemy
      return "あいこ"
    elsif (input == "グー" && enemy == "チョキ") || (input == "チョキ" && enemy == "パー") || (input == "パー" && enemy == "グー")
      return "勝ち"
    else
      return "負け"
    end
  end
  
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  input_hand = gets.chomp.to_i
  enemy_hand = rand(3)
  
  input_hand = convert(input_hand)
  enemy_hand = convert(enemy_hand)
  result = janken(input_hand, enemy_hand)
  
  puts "#{call}"
  puts "--------------------------------"
  puts "あなた：#{input_hand}を出しました"
  puts "てき：#{enemy_hand}を出しました"
  puts "--------------------------------"
  puts "じゃんけんの結果：#{result}"
  return result
end


def battle_hoi #あっち向いてホイメソッド
  def convert(number) #あっち向いてホイ内のメソッド：変換
    case number
      when 0
        return "上"
      when 1
        return "下"
      when 2
        return "左"
      when 3
        return "右"
      else
        puts "どれかにしてください！"
        exit
    end
  end
  
  def hoi(input, enemy) #あっち向いてホイ内のメソッド：条件分岐
    if input == enemy
      return "決着"
    else
      return "引き分け"
    end
  end
  
  puts "0(上) 1(下) 2(左) 3(右)"
  input_hand = gets.chomp.to_i
  enemy_hand = rand(4)
  
  input_hand = convert(input_hand)
  enemy_hand = convert(enemy_hand)
  result = hoi(input_hand, enemy_hand)
  
  puts "ホイ！！！！！！！"
  puts "--------------------------------"
  puts "あなた：#{input_hand}を向きました"
  puts "てき：#{enemy_hand}を向きました"
  puts "--------------------------------"
  return result
  
end


def output #結果の出力メソッド
  puts "じゃんけん..."
  janken_result = battle_jyanken("ホイ！！！！！！！")
  if janken_result == "あいこ"
    while janken_result == "あいこ"
    puts "あいこで..."
    janken_result = battle_jyanken("ショ！！！！！！！")
    end
  end
  
  puts "あっち向いて〜..."
  hoi_result = battle_hoi
  if hoi_result == "引き分け"
    return "お互い引き分けです"
  elsif janken_result == "勝ち"
    return "あなたは勝ちました"
  else
    return "あなたは負けました"
  end
end

#===========本文===========

total_result = output
if total_result == "お互い引き分けです"
  while total_result == "お互い引き分けです"
    puts "#{total_result}"
    total_result = output
  end
end

puts "--------------------------------"
puts total_result
puts "--------------------------------"