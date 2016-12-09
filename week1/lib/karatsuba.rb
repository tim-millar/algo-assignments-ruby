class Karatsuba

  def self.multiply(x, y)

    if x.to_s.size || y.to_x.size
      x * y
    else
      n = [x.to_s.size, y.to_s.size].max
      m = n / 2

      a = x / 10**m
      b = x % 10**m
      c = y / 10**m
      d = y % 10**m

      ac = multiply(a,c)
      bd = multiply(b,d)
      ad_plus_bc = multiply(a+b,c+d) - ac - bd

      ac * 10**(2*m) + (ad_plus_bc * 10**m) + bd
    end
  end
end
