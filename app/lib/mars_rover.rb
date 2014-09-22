class MarsRover
  DIRECTIONS = %w(N E S W)
  attr_reader :x_pos, :y_pos, :direction

  def initialize(x, y, direction)
    @x_pos = x
    @y_pos = y
    @direction = direction
  end

  def execute(cmd)
    directives = cmd.split(//)
    directives.each do |directive|
      if directive == 'M'
        move
      elsif directive == 'R'
        turn_right
      elsif directive == 'L'
        turn_left
      # else
      #   raise ArgumentError, 'invalid commands'
      end
    end
    "#{@x_pos} #{@y_pos} #{@direction}"
  end

  def move
    @y_pos = @y_pos + 1 if @direction == 'N'
    @x_pos = @x_pos + 1 if @direction == 'E'
    @y_pos = @y_pos - 1 if @direction == 'S'
    @x_pos = @x_pos - 1 if @direction == 'W'
  end

  def turn_left
    @direction = DIRECTIONS[(DIRECTIONS.find_index(@direction)+3) % DIRECTIONS.length]
  end

  def turn_right
    @direction = DIRECTIONS[(DIRECTIONS.find_index(@direction)+1) % DIRECTIONS.length]
  end
#
#   def run
#     while (line = gets) != "quit\n"
#       begin
#         puts execute(line.chomp)
#       rescue Exception => e
#         p e
#         line = gets
#         exit(1) if line == "quit\n"
#         retry
#       end
#     end
#   end
end

# MarsRover.new(1,1,'N').run