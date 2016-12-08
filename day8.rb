contents = File.read('day8.txt').strip

def print_grid(grid)
    grid.each do |column|
        column.each do |row|
            print row
        end
    puts "" 
    end
end

def rotate_grid_column(grid, column, value)
    puts "rotate column: #{column} by #{value}"
    grid.each_with_index do |row, index|
        puts index
        if index == column
        end
    end
end

def rotate_grid_row(grid, row, value)

end

# TODO - Use has instead of nested array
# a= Hash.new
# a[[1,2]]= 23
# a[[5,6]]= 42
grid = Array.new(6) { Array.new(50, 0) }

contents.each_line do |line|
    if line.start_with?("rect")
        width,height = line.split(" ")[1].split("x").map(&:to_i)
        (0).upto(height-1) do |i|
            (0).upto(width-1) do |j|
                grid[i][j] = 1
            end
        end
    elsif line.start_with?("rotate")
        temp = line.split(" ")
        xy, position = temp[2].split("=")
        value = temp[-1]
        if xy == "x"
            rotate_grid_column(grid, position, value)
        else
            rotate_grid_row(grid, position, value)
        end
    end
end

print_grid(grid)