require_relative '../person'
require_relative '../book'
require 'date'

describe Book do
  title = 'Game Of Thrones'
  author = 'George RR Martin'

  it 'user should be able to initialize a book instance' do
    book = Book.new(title, author)
    expect(book.title).to be title
    expect(book.author).to be author
  end

  it 'A book should be able to be rented' do
    book = Book.new(title, author)
    person = Person.new(18, 547, 'Peter', parent_permission: true)
    date = Date.parse '2023-02-08'
    book.add_rental(person, date)

    expect(book.rentals[0].person).to be person
  end
end
