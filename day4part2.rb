def decode(char, times)
    if char == '-'
        return ' '
    end
    alphabet = ('a'..'z').to_a
    index = alphabet.index(char)
    return alphabet[(index + times) - (alphabet.length)]
end

contents = File.read('day4.txt').strip

contents.each_line do |line|
    stripped = line.gsub(/[^a-zA-Z-]/, '')
    sectorId = line.scan(/\d+/).first.to_i
    times = sectorId % 26
    decoded = ""
    stripped.each_char do |c|
        decodedChar = decode(c, times) 
        decoded += decodedChar == nil ? "" : decodedChar
    end
    puts ("#{decoded} - #{sectorId}")
end

