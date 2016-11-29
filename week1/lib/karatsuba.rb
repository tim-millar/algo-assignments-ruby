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
      n = size_of_smallest_number

      i = x.to_s.size - n
      a = x.to_s[0..(i-1)].to_i
      b = x.to_s[i..-1].to_i
      j = y.to_s.size - n
      c = y.to_s[0..(j-1)].to_i
      d = y.to_s[j..-1].to_i

      z_2 = Karatsuba.multiply(a,c)
      z_0 = Karatsuba.multiply(b,d)
      z_1 = Karatsuba.multiply(a+b, c+d) - z_2 - z_0

      (10**(2*n))*z_2 + (10**n)*z_1 + z_0
    end
  end

  private

  def size_of_smallest_number
    [x.to_s.size, y.to_s.size].min - 1
  end

  def small_enough?
    x_small_enough? || y_emall_enough?
  end

  def x_small_enough?
    size_of_x < 2
  end

  def y_emall_enough?
    size_of_y < 2
  end

  def size_of_x
    x.to_s.size
  end

  def size_of_y
    y.to_s.size
  end
end
