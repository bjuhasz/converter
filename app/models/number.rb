class Number < ActiveRecord::Base
  
  def converted_number
    # Timothy Byrd's solution, which can be found at: 
    # http://www.rubyquiz.com/quiz25.html
    #  
    # A tobbi az vagy nem nineteen hundredot irt ki, 
    # vagy nem hasznalta az "and" szocskat.
    
    EnglishNumerals.to_English(number)
  end
end


