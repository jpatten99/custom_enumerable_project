module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    my_each do |val|
      yield(val, i)
      i += 1
    end
    self
  end

  def my_select
    return_array = []
    my_each do |value|
      return_array.push(value) if yield value
    end
    return_array
  end

  def my_all?
    answer = true
    my_each do |value|
      answer = false unless yield(value)
    end
    answer
  end

  def my_any?
    answer = false
    my_each do |value|
      answer = true if yield value
    end
    answer
  end

  def my_none?
    answer = true
    my_each do |value|
      answer = false if yield value
    end
    answer
  end

  def my_count
    return_array = []
    my_each do |value|
      return length unless block_given?

      return_array << value if yield value 
    end
    return_array.length
  end

  def my_map
    return_array = []
    my_each do |value|
      return_array.push(yield(value))
    end
    return_array
  end

  def my_inject(val)
    i = 0
    while i < length
      val = yield val, self[i]
      i += 1
    end
    val
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0 
    while i < count 
      yield(self[i]) 
      i += 1 
    end
    self 
  end
end
