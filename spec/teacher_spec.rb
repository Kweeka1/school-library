require './teacher'

describe Teacher do
  let(:teacher) { Teacher.new('doctor', 35, 'chris', 45, parent_permission: true) }
  before :each do
    @teacher = Teacher.new('specialization', 'age', 'name')
  end
  it 'returns new teacher object' do
    expect(@teacher).to be_instance_of Teacher
  end
  it 'return the correct name' do
    expect(teacher.name).to eq('chris')
  end
  it 'return the correct age' do
    expect(teacher.age).to eq(35)
  end
  it 'return the correct parent permission' do
    expect(teacher.parent_permission).to eq(true)
  end
  it 'return the correct id' do
    expect(teacher.id).to eq(45)
  end
  it 'return the correct specialization' do
    expect(teacher.specialization).to eq('doctor')
  end
end
