class Person
  @@contact_list = []
  attr_reader :name, :email
  # cattr_reader :@@contact_list


  def initialize(name, email)
    @name = name
    @email = email
    @@contact_list << name + ", " + email
    
 
  end

  def self.create
    @@contact_list
  end

end

joe = Person.new("Joe","@something")
pepe = Person.new("Pepe","@somethi")
robin = Person.new("robin", "@cool")


puts Person.create.inspect


