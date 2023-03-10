require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'
require_relative 'user_entry'
require 'date'

def main_section
  'Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person
7 - Exit'
end

class App
  def initialize(serializer, books = [], people = [])
    @books = books
    @people = people
    @serializer = serializer
  end

  def run
    loop do
      puts main_section
      choice = UserEntry.get_number('', 'Please enter a valid number!')
      if choice == 7
        @serializer.save('books', @books)
        @serializer.save('students', @people.select { |person| person.instance_of? Student })
        @serializer.save('teachers', @people.select { |person| person.instance_of? Teacher })
        @serializer.save_rentals(@people)
        return
      end

      run_available_options(choice)
    end
  end

  private

  def run_available_options(choice)
    case choice
    when 1
      list_books(@books)
    when 2
      list_people(@people)
    when 3
      add_person
    when 4
      @books << add_book
    when 5
      add_rental(@books, @people)
    when 6
      list_rentals(@people)
    else
      puts ''
    end
  end

  def add_person
    person_type = UserEntry.get_number(
      'Do you want to create a Student (1) or a teacher (2)?. Back to main (any number): ',
      'Please enter a valid number!'
    )

    case person_type
    when 1
      @people << add_student
    when 2
      @people << add_teacher
    else
      puts ''
    end
  end

  def add_student
    age = UserEntry.get_number('Age: ', 'Please enter a valid number!')
    name = UserEntry.get_str('Name: ', 'Please enter a proper name!')
    permission = UserEntry.get_bool('Parent permission (y/n): ', 'Please enter either (y/n)!')
    student = Student.new(age, name, parent_permission: permission)
    return unless student

    puts "Student #{name} is added!\n\n"
    student
  end

  def add_teacher
    specialization = UserEntry.get_str('Specialization: ', 'Please enter a proper specialization!')
    age = UserEntry.get_number('Age: ', 'Please enter a valid number!')
    name = UserEntry.get_str('Name: ', 'Please enter a proper name!')
    teacher = Teacher.new(specialization, age, name)
    return unless teacher

    puts "Teacher #{name} is added!\n\n"
    teacher
  end

  def add_book
    title = UserEntry.get_str('Title: ', 'Please enter a valid title!')
    author = UserEntry.get_str('Author: ', 'Please enter a valid author!')
    book = Book.new(title, author)
    return unless book

    puts "Book #{title} is created successfully!\n\n"
    book
  end

  def list_books(books, with_id: false)
    if with_id
      books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
    else
      if books.empty?
        puts "No books added yet\n\n"
        return
      end
      books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts ''
  end

  def list_people(people, with_id: false)
    if with_id
      people.each_with_index do |person, idx|
        puts "#{idx}) [#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    else
      if people.empty?
        puts "No person created yet\n\n"
        return
      end
      people.each { |person| puts "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
    end
    puts ''
  end

  def add_rental(books, people)
    if people.empty? || books.empty?
      puts "Either People or book List is empty. Please populate these lists in order to check rentals\n\n"
      return
    end

    puts 'Select a book from the following list:'
    list_books(books, with_id: true)
    book_idx = UserEntry.get_number('Book: ', 'Please enter a valid number!')

    puts 'Select a person from the following list:'
    list_people(people, with_id: true)
    person_idx = UserEntry.get_number('Borrower: ', 'Please enter a valid number!')
    date = UserEntry.get_date('Date: ', 'Please enter a valid date!')

    begin
      person = people.at(person_idx)
      book = books.at(book_idx)
      Rental.new(date, book, person)
    rescue NoMethodError
      puts "Book or person not found. Please try again!\n\n"
      return add_rental(books, people)
    end
    puts "Rental Added!\n\n"
  end

  def list_rentals(people)
    if people.empty?
      puts "People List is empty. Please add people in order to check their rentals\n\n"
      return
    end
    puts 'Select a person ID from the following list:'
    list_people(people)

    person_id = UserEntry.get_number('Person ID: ', 'Please enter a valid number!')
    person = people.find { |current_person| current_person.id == person_id }
    if person.nil?
      puts "Person with ID: #{person_id} not found!\n\n"
      return list_rentals(people)
    end

    if person.rentals.empty?
      puts "#{person.name} didn't rent any book yet\n\n"
    else
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} By #{rental.book.author}\n\n"
      end
    end
  end
end
