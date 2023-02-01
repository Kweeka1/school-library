class BaseDecorator < Nameable
  # @param [Nameable] nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  # @return [Nameable]
  def correct_name
    @nameable
  end
end
