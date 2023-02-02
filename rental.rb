class Rental
  attr_accessor :date, :book, :person

  # @param [Date] date
  # @param [Book] book
  # @param [Person] person
  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
