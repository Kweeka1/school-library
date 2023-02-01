class Book
  attr_accessor :title, :author, :rentals

  # @param [String] title
  # @param [String] author
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end
