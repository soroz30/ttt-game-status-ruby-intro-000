# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    positions = [position_1 = board[win_index_1],
    position_2 = board[win_index_2],
    position_3 = board[win_index_3]]

    if positions.all? {|i| i == "X"} || positions.all? {|i| i == "O"}
      return combination
    end
  end
  false
end

def full?(board)
  !(board.any?{|i| i == " "})
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    combination = won?(board)
    return board[combination[0]]
  else
    nil
  end
end
