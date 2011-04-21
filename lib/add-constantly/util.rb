module Addc
  module Util
    def self.euclidean_dist( x, y )
      d = 0
      (0..x.size-1).each do |i|
        d = d + (x[i]-y[i])*(x[i]-y[i])
      end
      Math.sqrt( d )
    end

    def self.vect_sub( x, y )
      x_minus_y = []
      (0..x.size-1).each do |i|
        x_minus_y[i] = x[i] - y[i]
      end
      x_minus_y
    end

    def self.vect_add( x, y )
      x_plus_y = []
      (0..x.size-1).each do |i|
        x_plus_y[i] = x[i] + y[i]
      end
      x_plus_y
    end

    def self.vect_mult_scalar( x, scalar )
      mult_x = x
      (0..x.size-1).each do |i|
        mult_x[i] = mult_x[i] * scalar
      end
      mult_x
    end
  end
end