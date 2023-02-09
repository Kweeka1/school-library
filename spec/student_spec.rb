require_relative '../student'
require_relative '../classroom'

describe Student do
  age = 22
  name = 'Peter'
  id = 223
  parent_permission = true
  classroom = Classroom.new('Math')

  it 'user should be able to initialize a student instance' do
    student = Student.new(age, name, id, parent_permission: parent_permission)

    expect(student).not_to be nil
    expect(student.id).to be id
    expect(student.name).to be name
    expect(student.age).to be age
  end

  it 'student should be able join a classroom' do
    student = Student.new(age, name, id, parent_permission: parent_permission)
    student.classroom = classroom

    expect(student.classroom).to be classroom
  end

  it 'student should be able play hooky' do
    student = Student.new(age, name, id, parent_permission: parent_permission)

    expect(student.play_hooky).to eq '¯\(ツ)/¯'
  end
end
