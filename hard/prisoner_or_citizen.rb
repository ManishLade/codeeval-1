# Partially achieved only (Score: 80)

class Point
  attr_reader :x, :y
  def initialize(x, y)
    if x < 0 || x > 10 || y < 0 || y > 10
      fail ArgumentError, 'Invalid coordinates'
    end
    @x = x
    @y = y
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def above?(other)
    y > other.y
  end
end

class Edge
  attr_reader :start_point, :end_point
  def initialize(start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end

  def same_y_axis?(y)
    min = [@start_point.y, @end_point.y].min
    max = [@start_point.y, @end_point.y].max
    y >= min && y <= max
  end

  def cross_axis?(y)
    return false if @start_point.y == y && @end_point.above?(@start_point)
    return false if @end_point.y == y && @start_point.above?(@end_point)
    return false if @end_point.y == y && @start_point.y == y
    same_y_axis?(y)
  end

  def right_to?(point)
    max = [@start_point.x, @end_point.x].max
    max > point.x
  end

  def include?(point)
    if @start_point.x == @end_point.x
      if same_y_axis?(point.y) && point.x == @start_point.x
        true
      else false
      end
    else
      m = (@end_point.y - @start_point.y) / (@end_point.x - @start_point.x)
      b = @start_point.y - @start_point.x * m
      point.y == (m * point.x) + b
    end
  end

  def ==(other)
    @start_point == other.start_point && @end_point == other.end_point
  end
end

class Polygon
  def initialize(edges)
    @edges = edges
  end

  def include?(point)
    @edges.each do |e|
      return true if e.include?(point)
    end
    crosses_right = 0
    crosses_left = 0
    @edges.each do |edge|
      if edge.cross_axis?(point.y)
        if edge.right_to?(point)
          crosses_right += 1
        else
          crosses_left += 1
        end
      end
    end
    return false if crosses_right.even? || crosses_left.even?
    true
  end
end

count = File.foreach(ARGV[0]).inject(0) { |c, _line| c + 1 }
fail ArgumentError, 'Too many test cases' if count > 20
lines = File.open(ARGV[0])
lines.each_line do |line|
  stream = line.split('|')
  prison_coordinates = stream[0].split(',')
  prison_points = prison_coordinates.map do |coordinates|
    raw_point = coordinates.split(' ')
    Point.new(raw_point[0].to_i, raw_point[1].to_i)
  end
  edges = []
  (1..prison_points.length - 1).each do |i|
    edges << Edge.new(prison_points[i - 1], prison_points[i])
  end
  edges << Edge.new(prison_points[prison_points.length - 1], prison_points[0])
  prison = Polygon.new(edges)
  raw_point_to_test = stream[1].split(' ')
  point_to_test = Point.new(raw_point_to_test[0].to_i, raw_point_to_test[1].to_i)
  if prison.include?(point_to_test)
    puts 'Prisoner'
  else puts 'Citizen'
  end
end
