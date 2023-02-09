require_relative '../person'
require_relative '../book'
require 'date'

describe Person do
  age = 17
  name = 'Peter'
  id = 223
  parent_permission = true

  it 'user should be able to initialize a person instance' do
    person = Person.new(age, id, name, parent_permission: parent_permission)

    expect(person).not_to be nil
    expect(person.age).to be age
    expect(person.name).to be name
    expect(person.id).to be id
  end

  it 'correct_name method should return student\'s name' do
    person = Person.new(age, id, name, parent_permission: parent_permission)
    correct_name = person.correct_name

    expect(correct_name).to be person.name
  end

  it 'can_use_services? method should return a boolean value based on person\'s age and parent permission' do
    person = Person.new(age, id, name, parent_permission: parent_permission)

    # should evaluate to false since student's age is less than 18
    expect(person.can_use_services?).to be false

    person.age = 22

    # should evaluate to true since student's age is more than 18 and has parent permission
    expect(person.can_use_services?).to be true
  end

  it 'A person should be able to rent books' do
    person = Person.new(age, id, name, parent_permission: parent_permission)
    book = Book.new('Fire And Blood', 'George RR Martin')
    date = Date.parse '2023-02-08'
    person.add_rental(book, date)

    expect(person.rentals[0].book).to be book
  end
end
