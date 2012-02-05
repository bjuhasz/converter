class Number # < ActiveRecord::Base
# http://railscasts.com/episodes/219-active-model?view=asciicast

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :number

  validates :number, :presence => true
  validates :number, :numericality => { :only_integer => true, :message => ": \"%{value}\" is not a number" }
  
  def converted_number
    # Timothy Byrd's solution, which can be found at: 
    # http://www.rubyquiz.com/quiz25.html
    #  
    # A tobbi az vagy nem nineteen hundredot irt ki, 
    # vagy nem hasznalta az "and" szocskat.
    
    EnglishNumerals.to_English(number)
  end
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
  def new_record?
    true
  end
end


