require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  # @param [String] title
  # @param [String] author
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # @param [Person] person
  # @param [Time] date
  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
