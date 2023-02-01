require_relative 'person'
class Teacher < Person
  # @param [Integer] age
  # @param [String] specialization
  # @param [String] name
  # @param [Boolean] parent_permission
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
