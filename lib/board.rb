class Board
  attr_accessor :board

  def initialize()
    @board = Array.new(3) {Array.new(3, " ")}
  end

  def check_score()
    #checks rows for a winner
    @board.map do |row| 
      

      row.map do |child|
        x_count = 0
        y_count = 0

        if child == "x"
          x_count += 1
        end

        if child == "y"
          y_count += 1
        end

        if x_count == 3 || y_count == 3
          return true
        else
          return false
        end

      end  
    end

    
  end

  def draw(player, x, y)
    @board[x][y] = player
    puts "#{player} has been added to the board at #{x}, #{y}"
  end

  def playGame()
    over = false

    while over == false
      print @board 
      print "\n"

      puts "Your player x! whats your move? (x y) "
      player_x = gets.chomp
      x_choice = player_x.split
      result_x = draw("x", x_choice[0].to_i, x_choice[1].to_i)

      over = check_score()

      puts "Your player y! whats your move? (x y) "
      player_y = gets.chomp
      y_choice = player_y.split
      result_y = draw("y", y_choice[0].to_i, y_choice[1].to_i)

      over = check_score()

    end
  end

end