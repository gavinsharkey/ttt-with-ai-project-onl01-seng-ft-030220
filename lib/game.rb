class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1=nil, player_2=nil, board=nil)
    self.player_1 = player_1 || Players::Human.new('X')
    self.player_2 = player_2 || Players::Human.new('O')
    self.board = board || Board.new
  end 

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |comb|
      pos1 = self.board.cells[comb[0]]
      pos2 = self.board.cells[comb[1]]
      pos3 = self.board.cells[comb[2]]
      ![pos1, pos2, pos3].include?(' ') && (pos1 == pos2 && pos2 == pos3)
    end
  end

  def draw?
    WIN_COMBINATIONS.none? do |comb|
      pos1 = self.board.cells[comb[0]]
      pos2 = self.board.cells[comb[1]]
      pos3 = self.board.cells[comb[2]]
      [pos1, pos2, pos3].include?(' ') || (pos1 == pos2 && pos2 == pos3)
    end
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    if win_comb = self.won?
      self.board.cells[win_comb[0]]
    end
  end

  def turn
    self.current_player.move(self.board)
  end

  def play
    while !self.over?
      self.turn
    end

    puts ''
    puts ''
    puts ''
    if self.won?
      puts "Congratulations #{self.winner}!"
      puts '-----'
      self.board.display
      puts '-----'
    elsif self.draw?
      puts "Cat's Game!"
      puts '-----'
      self.board.display
      puts '-----'
    end
  end
end