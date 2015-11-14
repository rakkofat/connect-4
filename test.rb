diag = [
  [nil, nil, nil, nil, nil, "O", nil],
  [nil, nil, nil, nil, "O", nil, nil],
  [nil, nil, nil, "O", nil, nil, nil],
  [nil, nil, "O", nil, nil, nil, nil],
  [nil, "O", nil, nil, nil, nil, nil],
  ["O", nil, nil, nil, nil, nil, nil]
]

# def rowify_diagonals(diag)
#   rowified = []
#   (0...diag.length).each do |row|
#     diagonal = []
#     x = row
#     y = 0
#     until x > diag.length || y > diag.first.length
#       diagonal << diag[x][y] unless nil
#       x += 1
#       y += 1
#     end
#     rowified << diagonal
#   end
#   rowified
# end

def rowify_diagonals(board)
  (0..5).collect { |i| board[x][y] }

end

p rowify_diagonals(diag)
