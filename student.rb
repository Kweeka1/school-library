require_relative 'person'

class Student < Person
  attr_reader :classroom

  # @param [Integer] age
  # @param [String] name
  # @param [Boolean] parent_permission
  def initialize(age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
  end

  # @return [String]
  def play_hooky
    '¯\(ツ)/¯'
  end

  # @param [Classroom] classroom
  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include? self
  end
end
