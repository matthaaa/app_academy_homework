FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishes)
  lengths = []
  longest_fish = ""
  fishes.each do |fish|
    lengths << fish.length
  end
  fishes.each_with_index do |fish, idx|
    longest_fish = fish unless fish.length < longest_fish.length
  end
  longest_fish
end

class Array
  # merge sort is n*log(n)
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    mid = count / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end

    result + left + right
  end
end

# uses merge sort which is n*log(n)
def dominant_octopus(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end

# linear
def linear_octopus(fishes)
  biggest = fishes.first

  fishes.each do |fish|
    biggest = fish if fish.length > biggest.length
  end

  biggest
end


SLOW_MOVES = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, slow_dance_moves)
  slow_dance_moves.each_with_index do |tile, index|
    return index if tile == direction
  end
end

FAST_MOVES = {
  "up" => 0,
  "right-up" => 1,
  "right"=> 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, moves)
  moves[direction]
end
