def times_two(arr)
  arr.map do |number|
    number.map { |num| puts num * 2 }
  end
end

times_two [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
