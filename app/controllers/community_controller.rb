class CommunityController < ApplicationController
    def main
        
    end
    
def test_bar
    @counter = Counter.find(1)
    @plus = @counter.plus
    @minus = @counter.minus
    @total = @plus + @minus
    @green_ratio = @plus.to_f / @total.to_f * 100
    @red_ratio = @minus.to_f / @total.to_f * 100
end
  
  def plus_cal
    result = Counter.find(1)
    result.plus += 1
    result.save
    
    redirect_to '/community/test_bar'
  end
  
  def minus_cal
    result = Counter.find(1)
    result.minus += 1
    result.save
    
    redirect_to '/community/test_bar'
  end
end
