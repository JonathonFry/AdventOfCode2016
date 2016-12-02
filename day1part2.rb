def calculateOrientation(orientation, direction)
    if direction.start_with?('R')
       if orientation.eql?(3)
           orientation = 0
        else
            orientation += 1
        end
    elsif direction.start_with?('L')
        if orientation.eql?(0)
           orientation = 3
        else
            orientation -= 1
        end
    end
    return orientation
end

def visitedBefore(position, visited)
    visited.each do |j|
        if j == position
            return true
        end
    end
    return false
end

contents = File.read('day1.txt')

position = [0,0]
orientations = ['n','e','s','w']
orientation = 0
directions = contents.strip.split(', ')
visited = Array.new(directions.length) { Array.new }

catch (:done) do
    directions.each do |direction|
        orientation = calculateOrientation(orientation, direction)
        
        value = direction[1..-1].to_i

        if orientation.eql?(0)
            (1).upto(value) do |i|
                position[1] += 1
                if visitedBefore(position, visited)
                    throw :done
                else
                    visited.insert(-1, Array.new(position))
                end
            end
        elsif orientation.eql?(1)
            (1).upto(value) do |i|
                position[0] += 1
                if visitedBefore(position, visited)
                    throw :done
                else
                    visited.insert(-1, Array.new(position))
                end
            end
        elsif orientation.eql?(2)
            (1).upto(value) do |i|
                position[1] -= 1
                if visitedBefore(position, visited)
                    throw :done
                else
                    visited.insert(-1, Array.new(position))
                end
            end
        elsif orientation.eql?(3)
            (1).upto(value) do |i|
                position[0] -= 1
                if visitedBefore(position, visited)
                    throw :done
                else
                    visited.insert(-1, Array.new(position))
                end
            end
        end 
    end
end

puts (position[0].abs + position[1].abs) 