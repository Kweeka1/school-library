require './base_decorator'
require './trimmer_decorator'
require './capitalize_decorator'
require 'test/unit'

describe BaseDecorator do
  before(:each) do
    @decorator = BaseDecorator.new('john doe')
  end
  it 'returns the decorated object' do
    expect(@decorator).to be_a_kind_of BaseDecorator
  end
end

describe TrimmerDecorator do
  decorator = 'ifeanyi oti joseph'
  it 'checks if the name is greater than 10' do
    expect(decorator.length).to be > 10
  end
end

describe CapitalizeDecorator do
  def capitalize?(nameable)
    nameable.capitalize
  end
  nameable = 'Jasper'
  it 'checks if the name is in uppercase' do
    expect(nameable).to match capitalize?(nameable)
  end
end
