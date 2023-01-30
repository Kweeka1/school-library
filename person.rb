class Person
  attr_reader :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? && parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

cl = Person.new(18, 'john', parent_permission: false)
puts cl.can_use_services?