require './classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('label')
  end
  it 'should return an instance of Classroom' do
    expect(@classroom).to be_an_instance_of(Classroom)
  end
  it 'should join student class' do
    classroom = Classroom.new('label')
    student = Student.new('age', 'name', 'parent_permission')
    student.classroom = classroom
  end
end
