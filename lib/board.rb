class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "  
    puts "-----------"  
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(pos)
    self.cells[pos.to_i - 1]
  end

  def full?
    self.cells.all? { |pos| pos != ' ' }
  end

  def turn_count
    self.cells.filter { |pos| pos != ' ' }.length
  end

  def taken?(pos)
    self.position(pos) != " "
  end

  def valid_move?(pos)
    !self.taken?(pos) && (1..9).include?(pos.to_i)
  end

  def update(pos, player)
    self.cells[pos.to_i - 1] = player.token if self.valid_move?(pos)
  end

end