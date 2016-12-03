def isValid(t)
    t = t.map(&:to_i).sort!
    if ((t[0] + t[1]) > t[2])
        return true
    else
        return false
    end
end

contents = File.read('day3.txt').strip
valid = 0
contents.each_line do |line|
    valid += isValid(line.split(' ')) ? 1 : 0 
end

puts valid
