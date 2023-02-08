#! /usr/bin/env ruby
require_relative 'app'
require_relative 'serializer'

def main
  puts "Welcome to School Library App!\n\n"
  serializer = Serializer.new
  books = serializer.load('books')
  students = serializer.load('students')
  teachers = serializer.load('teachers')
  rentals = serializer.load('rentals')
  people = students.concat(teachers)
  serializer.apply_rentals(books, people, rentals)
  app = App.new(serializer, books, people)
  app.run
end

main
