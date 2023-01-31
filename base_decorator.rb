class BaseDecorator < Nameable
  # @param [Nameable] nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable
  end
end
