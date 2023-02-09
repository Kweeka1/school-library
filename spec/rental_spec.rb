require './rental'
require './person'
require './book'

describe Rental do
  before(:each) do
    @book = Book.new('things fall apart', 'Ify Japan')
    @person = Person.new(22, 'Chris', true)
    @rental = Rental.new('20th-dec-2020', @book, @person)
  end
  it 'returns new rental object' do
    expect(@rental).to be_instance_of(Rental)
  end
  it 'returns person age' do
    expect(@rental.date).to eql('20th-dec-2020')
  end
  it 'returns new books object' do
    expect(@book).to be_instance_of(Book)
  end
  it 'returns books' do
    expect(@rental.book).to be(@book)
  end
  it 'returns person' do
    expect(@rental.person).to be(@person)
  end
end
