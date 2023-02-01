class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # @param [Student] student
  def add_student(student)
    @students << student
    student.classroom = self
  end
end
