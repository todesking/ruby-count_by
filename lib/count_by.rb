module Enumerable
  def count_by(&block)
    raise ArgumentError, "count_by: block not specified" unless block_given?

    each_with_object(Hash.new(0)) do|elm, h|
      h[yield(elm)] += 1
    end
  end
end
