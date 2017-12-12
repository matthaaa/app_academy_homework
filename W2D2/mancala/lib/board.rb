class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = Array.new (14) {[]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map.with_index do |cup, idx|
      if idx != 6 && idx != 13
        @cups[idx] += Array.new(4, :stone)
      end
    end
  end

  def valid_move?(start_pos)
    begin
      if !(1..6).to_a.include?(start_pos) || !(7..14).to_a.include?(start_pos)
        raise Exception.new("Invalid starting cup")
      end
    end
    return true
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      # Empty cup since the stone in the cup is the one we just placed.
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].flatten.empty? || @cups[7...13].flatten.empty?
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 1
      @name1
    when -1
      @name2
    when 0
      :draw
    end
  end
end
