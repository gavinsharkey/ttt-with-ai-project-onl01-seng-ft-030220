module Players
  class Human < Player
    def move(board)
      puts ''
      board.display
      puts "Move #{self.token} (1-9):"
      pos = gets.strip

      while !board.valid_move?(pos)
        puts 'Invalid Move'
        pos = gets.strip
      end

      board.update(pos, self)
      pos
    end
  end
end