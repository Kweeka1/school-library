require_relative 'person'
class Teacher < Person
  # @param [Integer] age
  # @param [String] specialization
  # @param [String] name
  # @param [Boolean] parent_permission
  def initialize(specialization, age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # @return [Boolean]
  def can_use_services?
    true
  end
end
