contents = File.read('day6.txt').strip

data = Hash.new(Hash.new)

contents.each_line do |line|
    line.strip.chars.map.with_index do |c, i|
        indexMap = data.fetch(i, Hash.new(0))
        indexMap[c] += 1
        data[i] = indexMap
    end
end

password = ""
data.each do |key, value|
    data[key] = value.sort_by{|x,y| y}.to_h
    password += data[key].keys[0]
end
puts password