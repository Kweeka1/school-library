require_relative 'person'

class Student < Person
  attr_reader :classroom

  # @param [Integer] age
  # @param [Classroom] classroom
  # @param [String] name
  # @param [Boolean] parent_permission
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
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

  # @param [Book] book
  # @param [Time] date
  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
