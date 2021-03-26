class Character
  def initialize(name, gender, hp, level, attack, defense, attribute, attackVoice, defenseVoice)
    @name = name
    @gender = gender
    @hp = hp
    @level = level
    @ap = attack
    @dp = defense
    @attibute = attribute
    @attackVoice = attackVoice
    @defenseVoice = defenseVoice
  end

  def name
    return @name
  end

  def gender
    return @gender
  end
end

class Attacker < Character 
  def ap
    return @ap
  end

  def damage(ap, dp)
    @hp = @hp - ap + dp
    return @hp
  end

  def attackVoice
    ran = rand(0..2)
    return @attackVoice[ran]
  end

  def defenseVoice
    return @defenseVoice
  end

  def dp
    return @dp
  end

  def hp
    return @hp
  end

  def levelUp
    @level = level
  end

  def attribute
    return @attibute
  end
end
