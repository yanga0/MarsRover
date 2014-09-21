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
    @y_pos = @y_pos + 1
  end

  def turn_left
    # code here
  end

  def turn_right
    @direction = $directions[($directions.find_index(@direction)+1) % $directions.length ]
  end
end