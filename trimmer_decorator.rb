require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator

  # This method returns the first ten characters of the person's name if the name is more than 10 characters
  # otherwise it returns his name unchanged.
  # @return [String] correct name
  def correct_name
    return @nameable.correct_name[/.{10}/] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
