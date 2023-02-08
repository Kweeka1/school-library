require 'json'

class Serializer
  def initialize(path = './data')
    @path = path
  end

  def load(file_name)
    data = []
    begin
      deserialized_data = JSON.load_file("#{@path}/#{file_name}.json")
      deserialized_data.each do |object|
        case file_name
        when 'books' then data << Book.new(object['title'], object['author'])
        when 'students'
          data << Student.new(object['age'], object['id'], object['name'],
                              parent_permission: object['parent_permission'])
        when 'teachers' then data << Teacher.new(object['specialization'], object['age'], object['id'], object['name'],
                                                 parent_permission: true)
        when 'rentals' then data << object
        end
      end
      data
    rescue Errno::ENOENT
      []
    end
  end

  def save_rentals(people)
    rentals = []
    people.each do |person|
      person.rentals.each do |rental|
        rentals << { 'date' => rental.date, 'book' => rental.book.title, 'person' => rental.person.id }
      end
    end
    serialized_data = JSON.dump(rentals)
    File.write("#{@path}/rentals.json", serialized_data)
  end
end
