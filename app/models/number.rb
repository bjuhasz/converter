class Number # < ActiveRecord::Base
# http://railscasts.com/episodes/219-active-model?view=asciicast

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :number

  validates :number, :presence => true
  
  # TODO
  # message talan jobb lenne i18n-nel, mert most furcsan nez ki az, hogy:
  # Number : "1999dd" is not a number
  # talan szebb lenne ez:
  # The given input (1999dd) is not a number
  validates :number, :numericality => { :only_integer => true, :message => ": \"%{value}\" is not a number" }

  # Timothy Byrd's solution, which can be found at: 
  # http://www.rubyquiz.com/quiz25.html
  #  
  # A tobbi az vagy nem nineteen hundredot irt ki, 
  # vagy nem hasznalta az "and" szocskat.  
  def converted_number
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


