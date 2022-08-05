require_relative "../polytreenode/lib/00_tree_node.rb"

class KnightPathFinder
  def initialize(starting_pos)
    @starting_pos = starting_pos
    @considered_positions = [starting_pos]
  end

  def new_move_positions

  end

  def self.valid_moves(pos) # [7,3]
    deltas = [
      [-1, -2],
      [-2, -1],
      [-2,  1],
      [-1,  2],
      [ 1, -2],
      [ 2, -1],
      [ 2,  1],
      [ 1,  2]
    ]
    new_positions = []

    deltas.each do |delta|
      vertical, horizontal = delta
      new_row = pos[0] + vertical
      new_col = pos[1] + horizontal
      if new_row <= 7 && new_col <= 7 && new_row >= 0 && new_col >= 0
        new_positions << [new_row, new_col]
      end
    end
    
    p new_positions
  end

  def new_move_positions(pos)
    all_valid_moves = KnightPathFinder.valid_moves(pos)
    only_new_valid_moves = []

    all_valid_moves.each do |position|
      if !@considered_positions.include?(position)
        only_new_valid_moves << position
      end
    end

    @considered_positions += only_new_valid_moves

    return only_new_valid_moves
  end

end