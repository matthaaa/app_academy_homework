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
    idx = start_pos
    num_stones = @cups[idx].length
    @cups[idx] = []
    i = 0

    # TODO: Insert logic and call next_turn
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return false
    elsif !@cups[ending_cup_idx].empty?
      return false
    else
      return true
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
  end
end
