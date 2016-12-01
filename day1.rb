def handleDirectionChange(position, orientation, direction)

   if direction.start_with?('R')
       if(orientation.eql?(3))
           orientation = 0
        else
            orientation += 1
        end
    elsif direction.start_with?('L')
        if(orientation.eql?(0))
           orientation = 3
        else
            orientation -= 1
        end
    end

    value = direction[-1].to_i
    if orientation.eql?(0)
        position[1] += value
    elsif orientation.eql?(1)
        position[0] += value
    elsif orientation.eql?(2)
        position[1] -= value
    elsif orientation.eql?(3)
        position[0] -= value
    end

return position, orientation
end

contents = File.read('day1.txt')

position = [0,0]
orientations = ['n','e','s','w']
orientation = 0
directions = contents.strip.split(', ')

directions.each do |direction|
   position, orientation = handleDirectionChange(position, orientation, direction) 
end

puts position
puts orientation