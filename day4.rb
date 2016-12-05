contents = File.read('day4.txt').strip

data = Hash.new(0)
sum = 0
contents.each_line do |line|
    stripped = line.gsub(/[^a-zA-Z]/, '')
    stripped.each_char do |c|
        data[c] +=1
    end
    data = data.sort_by { |key, value| [-value, key] }.to_h

    check = ""
    data.each do |key, value|
        check += key
        if check.length == 5
            break
        end
    end

    puts check
    data = Hash.new(0)

    if match = line.match(/\[(.*)\]/)
        if check == match.captures[0]
            sum += line.scan(/\d+/).first.to_i
        end
    end
end

puts sum