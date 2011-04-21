require 'add-constantly/util'

module Addc    
  module Centroid
    class Instance
      def initialize( x )
        @x = x
        @n = 0
      end

      def x
        @x
      end

      def n
        @n
      end

      def update!( newX )
        update_delta = Util.vect_mult_scalar( Util.vect_sub( newX, @x ), 1/(@n+1)  )
        @x = Util.vect_add( @x,  update_delta)
        @n = @n + 1
        self 
      end

      def merge!( centroid )
        @x = Util.vect_mult_scalar( Util.vect_add( Util.vect_mult_scalar(  @x, @n  ), 
        Util.vect_mult_scalar(  centroid.x, centroid.n  ) ) ,
        @n + centroid.n )
        @n = @n + centroid.n
        self
      end
    end
  end
