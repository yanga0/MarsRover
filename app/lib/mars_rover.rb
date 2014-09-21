class MarsRover
  $directions = %w(N E S W)
  attr_accessor :x_pos, :y_pos, :direction

  def initialize(x, y, direction)
    @x_pos = x
    @y_pos = y
    @direction = direction
  end

  def execute(cmd)
    directives = cmd.split(//)
    directives.each {
        |directive|
      if directive == 'M'
        move
      elsif directive == 'R'
        turn_right
      elsif directive == 'L'
        turn_left
      end
    }
    "#{@x_pos} #{@y_pos} #{@direction}"
  end

  def move
    @y_pos = @y_pos + 1 if @direction == 'N'
    @x_pos = @x_pos + 1 if @direction == 'E'
    @y_pos = @y_pos - 1 if @direction == 'S'
    @x_pos = @x_pos - 1 if @direction == 'W'
  end

  def turn_left
    @direction = $directions[($directions.find_index(@direction)+3) % $directions.length]
  end

  def turn_right
    @direction = $directions[($directions.find_index(@direction)+1) % $directions.length]
  end
end