require "readline"
require './character'

playerAttackVoice = ["くらえ!", "おりゃぁああ!!", "これで終わりだあぁあ!!!"]
enemyAttackVoice = ["ふっ...甘い、くたばれ", "教えてやる....絶望を....", "終焉だ"]
puts "プレイヤー名を入力してください"
playerName = gets.chomp!
playerAttribute = 1
puts "敵の名前を入力してください"
enemyName = gets.chomp!
enemyAttribute = 2
player = Attacker.new(playerName, "m", 1000, 1, 200, 100, playerAttribute, playerAttackVoice, "させるか!")
enemy = Attacker.new(enemyName, "m", 1000, 1, 100, 50, enemyAttribute, enemyAttackVoice, "無駄だ!")

while true do
  puts "#{player.name}はどうする?"
  puts "君のHP: #{player.hp}"
  puts "敵のHP #{enemy.hp}"
  enemySelect = rand(1..3)
  puts "1: 攻撃, 2: 防御"
  playerSelect = gets.chomp!
  # puts "ヒント :#{enemySelect}"
  if playerSelect === "1"
    Readline.readline("#{player.name}の攻撃!")
    Readline.readline("#{player.name}「#{player.attackVoice}」")
    if enemySelect === 2
      Readline.readline("#{enemy.name}は防御した!")
      Readline.readline("#{enemy.name}「#{enemy.defenseVoice}」")
    else
      enemy.damage(player.ap, player.dp)
      Readline.readline("#{enemy.name}はダメージを受けた!")
      if enemy.hp <= 0
        puts "#{enemy.name} は倒れた!!"
        puts "WINNER!"
        break
      end
    end
  elsif playerSelect != "1" && playerSelect != "2"
    Readline.readline("#{player.name}の攻撃!")
    Readline.readline("しかし、攻撃が外れてしまった...")
  end
  if enemySelect === 1
    Readline.readline("#{enemy.name}の攻撃!")
    Readline.readline("#{enemy.name}「#{enemy.attackVoice}」")
    if playerSelect === "2"
      Readline.readline("#{player.name}は防御した!")
      Readline.readline("#{player.name}「#{player.defenseVoice}」")
    else
      player.damage(enemy.ap, enemy.dp)
      Readline.readline("#{player.name}はダメージを受けた!")
      if player.hp <= 0
        puts "#{player.name} は倒れた..."
        puts "GAME OVER!"
        break
      end
    end
  elsif enemySelect != 1 && enemySelect != 2
    Readline.readline("#{enemy.name}の攻撃!")
    Readline.readline("しかし、攻撃が外れてしまった...")
  end
end
