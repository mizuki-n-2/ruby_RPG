module MessageDialog
  def start_message(**params)
    brave = params[:brave]
    monster = params[:monster]

    puts <<~EOS
    ーー戦闘開始ーー

    「#{brave.name} VS #{monster.name}」

    勇者(自分)
    名前: #{brave.name}
    HP: #{brave.hp}
    攻撃力: #{brave.offense}
    防御力: #{brave.defense}

    モンスター(敵)
    名前: #{monster.name}
    HP: #{monster.hp}
    攻撃力: #{monster.offense}
    防御力: #{monster.defense}
    ※モンスターはHPが半分以下になるとドラゴンに変身して攻撃力が3倍になる

    EOS
  end

  def select_action_message
    puts <<~EOS
    攻撃方法を選択してください(番号を入力してください)。

    1. 通常攻撃
    2. 必殺攻撃(攻撃力が1.5倍)
    3. 守りに徹する(防御力が1.2倍)

    EOS
  end

  def miss_message
    puts "何もできなかった"
  end

  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  def defense_up_message
    puts "#{@name}の防御力が#{@defense}になった"
  end

  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    if damage > 0
      puts <<~EOS

      #{target.name}は#{damage}のダメージを受けた
      #{target.name}の残りHPは#{target.hp}だ

      EOS
    else
      puts <<~EOS

      #{target.name}はダメージを受けなかった

      EOS
    end
  end

  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    puts <<~EOS

    #{origin_name}は怒っている
    #{origin_name}は#{transform_name}に変身した

    EOS
  end

  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS

      勝利！！！
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた

      EOS
    else
      puts <<~EOS

      敗北。。。
      目の前が真っ暗になった

      EOS
    end

    puts "ーー戦闘終了ーー"
  end
end