class HomeController < ApplicationController
  
  def index
  end
  
  def testreview
  end
  
  def labreview
  end
  
  def directiontest
    @origin = params[:origin].gsub(/\s/, '+')
    @destination = params[:destination].gsub(/\s/, '+')
  end
  
  def directionform
  end
  
end
