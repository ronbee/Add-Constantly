require 'add-constantly/util'
require 'add-constantly/centroid'

module Addc
  class Alg
    def initialize( upperBoundOnNumClusters )
      @k_max = upperBoundOnNumClusters
      @centroids = []      
    end

    def observe( instance )
      if @centroids.size == 0
        @centroids << Addc::Centroid::Instance.new( instance )
        return self
      end

      @centroids.sort! {|c1, c2|   Util.euclidean_dist(c1.x, instance)<=>Util.euclidean_dist(c2.x, instance)  }
      closest_centroid = @centroids.first
      closest_centroid.update!( instance )

      if( @centroids.size >= @k_max ) 
        pairs = [] 
        @centroids.each_index do |i|
          min_d = -99999
          min_c = 0          
          @centroids.each_index do |j|
            next if i==j
            d = Util.euclidean_dist( @centroids[i].x, @centroids[j].x )
            min_c = j if d < min_d
            min_d = d if d < min_d
          end
          pairs[i] = [ min_d, i, min_c]
        end
        pairs.sort! {|x,y| x[0]<=>y[0]}
        merge_info = pairs.first
        @centroids[merge_info[1]].merge!( @centroids[merge_info[2]] )
        @centroids = @centroids - [ @centroids[merge_info[2]] ]
      end
      @centroids << Addc::Centroid::Instance.new( instance )
    end

    def getCentroids( min_num_instances_in_cluster = 2 )
      @centroids.each_index do |i|
        next if @centroids[i].n >= min_num_instances_in_cluster
        min_d = -99999
        min_c = @centroids.first
        @centroids.each_index do |j|
          next if i==j
          d = Util.euclidean_dist( @centroids[i], @centroids[j] )
          min_c = @centroids[j] if d < min_d
          min_d = d if d < min_d
        end
        @centroids[i].merge!( min_c )
        @centroids = @centroids - [ min_c ]
      end
      @centroids
    end

  end
end 
