contents = File.read('day7.txt').strip


# An IP supports SSL if it has an Area-Broadcast Accessor, or ABA, anywhere in the supernet sequences (outside any square bracketed sections), 
# and a corresponding Byte Allocation Block, or BAB, anywhere in the hypernet sequences. 
# An ABA is any three-character sequence which consists of the same character twice with a different character between them, such as xyx or aba. 
# A corresponding BAB is the same characters but in reversed positions: yxy and bab, respectively.

# aba[bab]xyz supports SSL (aba outside square brackets with corresponding bab within square brackets).


def isAba(string)
    abas = Array.new
    (0).upto(string.length - 1) do |n|
        break if string.length == n+2
        if string[n] == string[n+2] and string[n+1] != string[n]
            abas.push(string[n..n+2])
        end 
    end
    if abas.length > 0
        return true, abas
    end
    return false
end

def isBab(hypernet, aba)
    (0).upto(hypernet.length - 1) do |n|
        break if hypernet.length == n+2
        temp = ""
        if hypernet[n] == hypernet[n+2]
            temp = hypernet[n+1] + hypernet[n] + hypernet[n+1]
        end

        aba.each do |value|
            if temp == value
                puts ("#{temp}, #{value}, #{hypernet}")
                return true
            end
        end
    end
    
    return false
end

validIps = 0
contents.each_line do |line|
    valid = false
    
    hypernet = line.scan(/\[(.*?)\]/)
    ips = line.gsub(/\[(.*?)\]/, " ").split(" ")
    
    ips.each do |ip|
            isAba, value = isAba(ip)
            if isAba
                puts value
                hypernet.each do |hyper|
                    isBab = isBab(hyper.join("").to_s, value)
                    if isBab
                        valid = true
                        break
                    end
                end
                
            end
        end
    
    if valid
        validIps += 1
    end
end

puts validIps

# 19 = too low
# 364 = too high