require './character'

class Brave < Character
  SPECIAL_ATTACK_CONSTANT = 1.5
  DEFENSE_UP_CONSTANT = 1.2

  def action(monster)
    select_action_message
    action_num = gets.chomp!
    action_type = decision_action_type(action_num: action_num)

    if action_type == "defense_up"
      @defense *= DEFENSE_UP_CONSTANT
      defense_up_message
    end

    if action_type == "special_attack" || action_type == "normal_attack"
      damage = calculate_damage(target: monster, attack_type: action_type)
  
      cause_damage(target: monster, damage: damage)
  
      attack_message(attack_type: action_type)
      
      damage_message(target: monster, damage: damage)
    end
  end

  private

    def decision_action_type(**params)
      action_num = params[:action_num]
      
      if action_num == "1"
        "normal_attack"
      elsif action_num == "2"
        "special_attack"
      elsif action_num == "3"
        "defense_up"
      else
        miss_message
      end
    end

  def calculate_damage(**params)
    target = params[:target]
    attack_type = params[:attack_type]

    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else 
      @offense - target.defense
    end
  end

  def cause_damage(**params)
    target = params[:target]
    damage = params[:damage]

    target.hp -= damage if damage > 0

    target.hp = 0 if target.hp < 0
  end

  def calculate_special_attack
    @offense*SPECIAL_ATTACK_CONSTANT
  end
end