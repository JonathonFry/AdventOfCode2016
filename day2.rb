require 'matrix'

UP = "U"
DOWN = "D"
LEFT = "L"
RIGHT = "R"

def generatePin(x, y, line)
    line.each_char do |c|
        if c.eql?(UP)
            y -=1
            y = y < 0 ? 0 : y
        elsif c.eql?(DOWN)
            y +=1
            y = y > 2 ? 2 : y
        elsif c.eql?(LEFT)
            x -=1
            x = x < 0 ? 0 : x
        elsif c.eql?(RIGHT)
            x +=1
            x = x > 2 ? 2 : x
        end
    end
    return x, y
end

contents = File.read('day2.txt').strip

pinpad = Matrix[[1,2,3], 
                [4,5,6], 
                [7,8,9]]
x = 1
y = 1
pin = ""

contents.each_line do |line|
    x, y = generatePin(x, y, line)
    pin += pinpad[y,x].to_s
end

puts pin