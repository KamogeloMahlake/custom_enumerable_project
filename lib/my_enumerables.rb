module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    for x in self do
      yield x, index
      index += 1
    end
  end

  def my_select
    array = []
    self.my_each do |elem|
      if yield(elem)
        array << elem
      end
    end
    array
  end

  def my_all?
    self.my_each do |elem|
      if !yield(elem)
        return false
      end
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      if yield(elem)
        return true
      end
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      if yield(elem)
        return false
      end
    end
    true
  end

  def my_count 
    count = 0
    return self.length if !block_given?    
    self.my_each do |i|
      if yield(i)
        count += 1
      end
    end
    count
  end

  def my_map
    array = []

    self.my_each do |item|
      array << yield(item)
    end
    array
  end

  def my_inject(value=0)
    result = value
    self.my_each do |item|
      result = yield(result, item)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for x in self do
      yield x
    end
    self
  end
end
