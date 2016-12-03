def isValid(t)
    t = t.map(&:to_i).sort!
    if ((t[0] + t[1]) > t[2])
        return true
    else
        return false
    end
end

valid = 0

data = {
    0 => [],
    1 => [],
    2 => []
}

File.foreach('day3.txt').with_index do |line, i|
   line.split(' ').each_with_index do |row, j|
       data[j].push(row.to_i)
    end
end

data.each do |key, value|
    (0...value.length).step(3).each do |index|
        valid += isValid([value[index], value[index + 1], value[index + 2]]) ? 1 : 0
    end
end
puts valid
