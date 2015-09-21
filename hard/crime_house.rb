# While working for the police, you've identified a house where
# people go to commit crimes, called Crime House.
# One day, you set up a camera over the door of the house and record a video.

# You don't know how many people were in Crime House at the start of the day,
# but you can see people enter and leave through the front door.
# Unfortunately, because the people entering and leaving Crime House are criminals,
# sometimes they wear masks;
# and you aren't quite sure if the front door is the only way in or out.

# Sometimes you can guess who was wearing a mask.
# If criminal #5 entered the house, then someone wearing a mask left,
# then criminal #5 entered the house again, then either the
# person wearing the mask was criminal #5,
# or there is another way out of Crime House.

# At the end of the day, when Crime House has closed
# its doors for the night, you watch your video.
# Because you're an optimist, you want to figure out if it's possible
# that there are no other entrances or exits from crime house;
# and if so, you want to figure out the minimum number of people
# who could be in Crime House at the end of the day.
class CrimeError < StandardError
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

lines = File.open(ARGV[0])
lines.each_line do |line|
  moves_hash = {}
  count = 0
  begin
    stream = line.split(';')
    moves = stream[1].split('|')
    moves.each do |raw_move|
      move = raw_move.split(' ')
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
