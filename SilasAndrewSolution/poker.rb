class Hand
  attr_accessor :cards
  def initialize(card1, card2, card3, card4, card5)
    @cards = [card1, card2, card3, card4, card5]
  end

  def is_greater?(other_hand)
    return _hand_value > other_hand._hand_value
  end

  def _hand_value
    return 10 if _is_straight_flush?
    return 9 if _is_4_of_kind?
    return 8 if _is_flush?
    return 7 if _is_straight?
    return 4 if _is_3_of_kind?
    return 3 if _is_two_pairs?
    return 2 if _is_2_of_kind?
    0
  end

  def _is_straight_flush?
    _is_straight? && _is_flush?
  end

  def _is_straight?
    values = @cards.map{|card| card.value}.sort
    # iterate over indices 0 to 3 (comparing to 1 to 4)
    0.upto(3) do |i|
      if values[i + 1] != values[i] + 1
        return false
      end
    end
    true
  end

  def _is_flush?
    hash = Hash.new()
    @cards.each do |card|
      hash[card.suit] = true
    end
    hash.size == 1
  end

  def _is_4_of_kind?
    hash = Hash.new()
    @cards.each do |card|
      hash[card.value] = true
    end
    hash.size == 2
  end

  def _is_3_of_kind?
    hash = Hash.new()
    @cards.each do |card|
      if hash.has_key?(card.value)
        hash[card.value] += 1
      else
        hash[card.value] = 1
      end
    end
    hash.values.max == 3
  end

  def _is_2_of_kind?
    hash = Hash.new()
    @cards.each do |card|
      hash[card.value] = true
    end
    hash.size == 4
  end

  def _is_two_pairs?
    hash = Hash.new()
    @cards.each do |card|
      if hash.has_key?(card.value)
        hash[card.value] += 1
      else
        hash[card.value] = 1
      end
    end
    hash.size == 3 && hash.values.max == 2
  end
end

class Card
	attr_reader :value, :suit
	def initialize(value, suit)
		@value = value
		@suit = suit
	end

end
