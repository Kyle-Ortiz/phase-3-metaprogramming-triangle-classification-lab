class Triangle
  attr_accessor :sides
  
  def initialize(side_1,side_2,side_3)
    @sides = []
    @sides.push(side_1)
    @sides.push(side_2)
    @sides.push(side_3)
  end

  def tri_checker
    index_2 = -1
    index_3 = -2
    previous_side = sides[index_2]
    third_side = sides[index_3]
    sides.each do |side|
      if side <= 0 
        raise TriangleError
      elsif side + previous_side <= third_side
        raise TriangleError
      end
      index_2 +=1
      index_3 += 1
    end
  end

  def kind 
    tri_checker

    if sides[0]==sides[1] && sides[1]==sides[2] 
      :equilateral
    elsif sides[0]==sides[1] || sides[1]==sides[2] || sides[2]==sides[0]
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
