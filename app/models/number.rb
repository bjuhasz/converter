class Number < ActiveRecord::Base
  validates :number, :presence => true
  validates :number, :numericality => { :only_integer => true }
  
  def converted_number
    # Timothy Byrd's solution, which can be found at: 
    # http://www.rubyquiz.com/quiz25.html
    #  
    # A tobbi az vagy nem nineteen hundredot irt ki, 
    # vagy nem hasznalta az "and" szocskat.
    
    EnglishNumerals.to_English(number)
  end
end


