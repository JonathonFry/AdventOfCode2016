require 'digest'

value = File.read('day5.txt').strip
password = ""
index = 0
(1).upto(8) do |i|
    hash = ""
    while (not hash.start_with?('00000')) do
        hash = Digest::MD5.hexdigest(value + index.to_s)
        index += 1
    end
    password += hash[5]
end
puts password