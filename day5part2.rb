require 'digest'

value = File.read('day5.txt').strip
password = Array.new(8)
index = 0
(1).upto(8) do |i|
    hash = ""
    calculating = true
    while (calculating) do
        hash = Digest::MD5.hexdigest(value + index.to_s)
        index += 1

        if hash.start_with?('00000') and (hash[5] =~ /\A\d+\z/) and hash[5].to_i >= 0 and hash[5].to_i <= 7 and password[hash[5].to_i] == nil
            calculating = false
        end
    end
    password[hash[5].to_i] = hash[6]
    puts password
end
puts password