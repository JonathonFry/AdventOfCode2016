contents = File.read('day7.txt').strip

def isAbba(string)
    (0).upto(string.length - 1) do |n|
        break if string.length == n+3
        if string[n] == string[n+1]
        elsif string[n] == string[n+3] and string[n+1] == string[n+2]
            return true, string[n..n+3]
        end 
    end
    return false, string
end

validIps = 0
contents.each_line do |line|
    valid = false
    
    hypernet = line.scan(/\[(.*?)\]/)
    ips = line.gsub(/\[(.*?)\]/, " ").split(" ")
    
    hyperValid = true
    
    hypernet.each do |hyper|
        isAbba, value = isAbba(hyper.join("").to_s)
        puts "#{isAbba}, #{value}"
        if isAbba
            hyperValid = false
            break
        end
    end
    
    next if !hyperValid
    
    ips.each do |ip|
        isAbba, value = isAbba(ip)
        puts "#{isAbba}, #{value}"
        if isAbba
            valid = true
            break
        end
    end
    
    if valid
        validIps += 1
    end
end

puts validIps