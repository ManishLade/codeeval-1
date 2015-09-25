class CrimeError < StandardError
end
class InputError < StandardError
end
def unbreak_moves(hash, move_type)
  selector = get_opposite_move_type(move_type)
  hash.keys.select { |key| key.include?(selector) }.each do |key, _value|
    hash[key] = false
  end
end

def break_or_update_move(hash, move)
  key = move[0] + move[1]
  fail CrimeError if hash[key] == true
  opposite_move = get_opposite_move_type(move[0])
  opposite_move_key = opposite_move + move[1]
  hash[opposite_move_key] = false
  hash[key] = true
end

def get_opposite_move_type(move_type)
  if move_type == 'L'
    return 'E'
  else return 'L'
  end
end

def update_move_count(move_type, count)
  if move_type == 'L'
    operation = -1
  else operation = 1
  end
  [0, count + operation].max
end

count = File.foreach(ARGV[0]).inject(0) { |c, _line| c + 1 }
fail InputError, 'too many test cases' if count > 20
lines = File.open(ARGV[0])
lines.each_line do |line|
  moves_hash = {}
  count = 0
  begin
    stream = line.split(';')
    fail InputError, 'too many events' if stream[0].to_i > 15
    fail InputError, 'there must be at least one event' if stream[0].to_i < 1
    moves = stream[1].split('|')
    moves.each do |raw_move|
      move = raw_move.split(' ')
      fail InputError, 'id cannot be greater than 2000' if move[1].to_i > 2000
      if move[1] == '0'
        unbreak_moves(moves_hash, move[0])
      else
        break_or_update_move(moves_hash, move)
      end
      count = update_move_count(move[0], count)
    end
    puts count
  rescue CrimeError => e
    puts 'CRIME TIME'
  end
end
