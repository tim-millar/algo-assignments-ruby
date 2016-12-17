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
    if x_is_one_digit? || y_is_one_digit?
      x * y
    else
      a = x / 10**half_min_digit_size
      b = x % 10**half_min_digit_size
      c = y / 10**half_min_digit_size
      d = y % 10**half_min_digit_size

      ac = Karatsuba.multiply(a,c)
      bd = Karatsuba.multiply(b,d)
      ad_plus_bc = Karatsuba.multiply(a+b,c+d) - ac - bd

      ac * 10**(2*half_min_digit_size) + (ad_plus_bc * 10**half_min_digit_size) + bd
    end
  end

  private

  def minimum_digit_size
    [x.to_s.size, y.to_s.size].max
  end

  def half_min_digit_size
    minimum_digit_size / 2
  end

  def x_is_one_digit?
    x.to_s.size == 1
  end

  def y_is_one_digit?
    y.to_s.size == 1
  end

end
