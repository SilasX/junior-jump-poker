require './poker.rb'

describe 'card' do
  it "returns suit" do
    card = Card.new(3, :spade)
    expect(card.value).to eq(3)
    expect(card.suit).to eq(:spade)
  end
end

describe 'hand of cards' do
  before do
    @hand = Hand.new(
      Card.new(2, :spade),
      Card.new(2, :diamond),
      Card.new(7, :diamond),
      Card.new(4, :heart),
      Card.new(4, :club),
    )
  end

  it "has a spade if initialized with one" do
    expect(@hand.cards.map {|x| x.suit == :spade}).to include(true)
  end

  it "compares to other hand" do
    hand2 = Hand.new(
      Card.new(7, :spade),
      Card.new(7, :diamond),
      Card.new(8, :diamond),
      Card.new(7, :heart),
      Card.new(9, :club),
    )
    expect(@hand.is_greater?(hand2)).to eq(false)
  end

  it "recognizes flushes" do
    hand3 = Hand.new(
      Card.new(2, :spade),
      Card.new(6, :spade),
      Card.new(8, :spade),
      Card.new(11, :spade),
      Card.new(13, :spade),
    )
    expect(hand3._is_flush?).to eq(true)
    hand4 = Hand.new(
      Card.new(2, :diamond),
      Card.new(6, :spade),
      Card.new(8, :spade),
      Card.new(11, :spade),
      Card.new(13, :spade),
    )
    expect(hand4._is_flush?).to eq(false)
  end

  it "recognizes 4 of a kinds" do
  	hand5 = Hand.new(
  		Card.new(3, :spade),
  		Card.new(3, :diamond),
  		Card.new(3, :heart),
  		Card.new(3, :club),
  		Card.new(4, :spade)
  	)
  	expect(hand5._is_4_of_kind?).to eq(true)
  end

  it "recognizes 3 of a kinds" do
    hand5 = Hand.new(
      Card.new(3, :spade),
      Card.new(3, :diamond),
      Card.new(3, :heart),
      Card.new(4, :club),
      Card.new(5, :spade)
    )
    expect(hand5._is_3_of_kind?).to eq(true)
  end

  it "recognizes 2 of a kinds" do
    hand5 = Hand.new(
      Card.new(3, :spade),
      Card.new(3, :diamond),
      Card.new(6, :heart),
      Card.new(4, :club),
      Card.new(5, :spade)
    )
    expect(hand5._is_2_of_kind?).to eq(true)
  end

  it "recognizes two pair hands" do
    hand5 = Hand.new(
      Card.new(3, :spade),
      Card.new(3, :diamond),
      Card.new(6, :heart),
      Card.new(6, :club),
      Card.new(7, :spade)
    )
    expect(hand5._is_two_pairs?).to eq(true)
  end

  it "recognizes straights" do
    hand5 = Hand.new(
      Card.new(3, :spade),
      Card.new(4, :diamond),
      Card.new(5, :heart),
      Card.new(6, :club),
      Card.new(7, :spade)
    )
    expect(hand5._is_straight?).to eq(true)
  end

  it "recognizes straight flushes" do
    hand5 = Hand.new(
      Card.new(3, :spade),
      Card.new(4, :spade),
      Card.new(5, :spade),
      Card.new(6, :spade),
      Card.new(7, :spade)
    )
    expect(hand5._is_straight_flush?).to eq(true)
  end
end
