require_relative 'nameable'
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  # @param [Integer] age
  # @param [String] name
  # @param [Boolean] parent_permission
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # @return [String] name
  def correct_name
    @name
  end

  # @return [Boolean]
  def can_use_services?
    of_age? && @parent_permission
  end

  private

  # @return [Boolean]
  def of_age?
    @age >= 18
  end
end
