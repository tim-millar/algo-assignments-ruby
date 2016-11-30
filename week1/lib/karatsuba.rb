class Karatsuba
  attr_reader :x, :y
  private :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def self.multiply(x, y)
    new(x, y).multiply
  end

  def multiply
    if small_enough?
      x * y
    else
      z_2 = left_x * left_y
      z_0 = Karatsuba.multiply(right_x, right_y)
      z_1 = Karatsuba.multiply(left_x+right_x, left_y+right_y) - z_2 - z_0

      left_padding*z_2 + mid_padding*z_1 + z_0
    end
  end

  private

  def digits_in_smallest_number
    [size_of_x, size_of_y].min - 1
  end

  def small_enough?
    x_small_enough? || y_small_enough?
  end

  def x_small_enough?
    size_of_x < 2
  end

  def y_small_enough?
    size_of_y < 2
  end

  def size_of_x
    x.to_s.size
  end

  def size_of_y
    y.to_s.size
  end

  def x_cutoff
    size_of_x - digits_in_smallest_number
  end

  def y_cutoff
    size_of_y - digits_in_smallest_number
  end

  def left_padding
    10**(2*digits_in_smallest_number)
  end

  def mid_padding
    10**digits_in_smallest_number
  end

  def x_string
    x.to_s
  end

  def y_string
    y.to_s
  end

  def left_x
    x_string[0..(x_cutoff-1)].to_i
  end

  def right_x
    x_string[x_cutoff..-1].to_i
  end

  def left_y
    y_string[0..(y_cutoff-1)].to_i
  end

  def right_y
    y_string[y_cutoff..-1].to_i
  end
end
