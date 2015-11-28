# You are given several strings that may/may not be valid emails.
# You should write a regular expression that determines if the
# email id is a valid email id or not.
# You may assume all characters are from the english language.

# Challenge partially completed only (75%)

lines = File.open(ARGV[0])
lines.each do |line|
  next if line.empty?
  if line.match '^[a-zA-Z0-9\_\+\-\'\!\$\&\*\=\`\^\|\~\#\%\'\+\/\?\_\{\}]+\.?' \
    '@[a-zA-Z0-9-]+\.[a-zA-Z0-9\-]+\.?[a-zA-Z0-9]+$'
    puts 'true'
  else puts 'false'
  end
end
