module Players
  class Computer < Player
    def opposing_token
      self.token == 'X' ? 'O' : 'X'
    end

    def move(board)
      puts ''
      board.display
      moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      move = 0

      near_win = Game::WIN_COMBINATIONS.detect do |comb|
        pos1 = board.cells[comb[0]]
        pos2 = board.cells[comb[1]]
        pos3 = board.cells[comb[2]]

        ![pos1, pos2, pos3].include?(self.token) && ((pos1 == self.opposing_token && pos2 == self.opposing_token) || (pos2 == self.opposing_token && pos3 == self.opposing_token) || (pos1 == self.opposing_token && pos3 == self.opposing_token))
      end

      if near_win
        move = near_win.detect { |pos| board.valid_move?(pos + 1)  }
        move = move + 1 if move
      end

      while !board.valid_move?(move)
        move = moves.sample
      end

      board.update(move, self)
      move
    end
  end
end