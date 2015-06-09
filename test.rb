class Test
  @@contacts = []
  attr_accessor :phone, :name
  def initialize(name,phone={})
    @name = name
    @phone = phone
  end

  def add_phone(type, number)
    @phone[type.to_sym] = number
  end 

  def to_s
    "#{@name}, #{@phone}"
  end

  def contacts_puts
    puts @@contacts.inspect
  end

  def self.create(name, phone)
    @@contacts << Test.new(name, phone)
  end

end


contact = Test.create("robin",:home => 5555)

contact[0].add_phone("cellphone", 1234)
contact[0].name = "pepe"




puts contact.inspect
puts contact



