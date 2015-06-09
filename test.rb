class Test
  attr_accessor :count
  def initialize(count=0)
    @count = count
  end

  def add_count
    @count += 1
  end 

  def to_s
    "#{count}"
  end
end

test1 = Test.new
test1.add_count

puts test1

