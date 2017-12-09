require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize()
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts @seq
    until @game_over == true
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    puts "\n"
    puts show_sequence
    puts "\n"
    require_sequence
    if @game_over == false
      @sequence_length += 1
      round_success_message
    end
  end

  def show_sequence
    add_random_color
    @seq
  end

  def require_sequence
    @seq.each do |color|
      guess = nil
      until COLORS.include?(guess)
        puts "Guess a color, one at a time! (blue, green, red, yellow)"
        guess = gets.chomp
        if !COLORS.include?(guess)
          puts "Oops! Guess a valid color! Watch out for spaces"
        end
      end
      if color != guess
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "\n"
    puts "Nice guess!"
    puts "\n"
  end

  def game_over_message
    puts "Game over!"
    puts "Your Score: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    Simon.new
  end
end
