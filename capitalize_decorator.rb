require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  # Returns capitalized name
  # @return [String]
  def correct_name
    @nameable.correct_name.capitalize
  end
end
