require 'matrix'

UP = "U"
DOWN = "D"
LEFT = "L"
RIGHT = "R"

def generatePin(x, y, line, pinpad)
    line.each_char do |c|
        if c.eql?(UP)
            if pinpad[x, (y - 1)] != 0 and y > 0
                y -=1    
            end
        elsif c.eql?(DOWN)
            if pinpad[x, (y + 1)] != 0 and y < (pinpad.row_count - 1)
                y +=1    
            end
        elsif c.eql?(LEFT)
            if pinpad[(x - 1), y] != 0 and x > 0
                x -=1    
            end
        elsif c.eql?(RIGHT)
            if pinpad[(x + 1), y] != 0 and x < (pinpad.row_count - 1)
                x +=1    
            end
        end
    end
    return x, y
end

contents = File.read('day2.txt').strip

pinpad = Matrix[[0,0,1,0,0], 
                [0,2,3,4,0], 
                [5,6,7,8,9],
                [0,"A","B","C",0],
                [0,0,"D",0,0]]
x = 0
y = 2
pin = ""

contents.each_line do |line|
    x, y = generatePin(x, y, line, pinpad)
    pin += pinpad[y,x].to_s
end

puts pin