class HomeController < ApplicationController
  
  def index
    @lab_db = TestCenter.all
    @point_array = Array.new
    @lab_db.each do |x|
      @point_array.push(x.review_point.round(0))
    end
  end
  
  def testreview
  end
  
  
  def labreview
     @testcenter=TestCenter.all
    # @sort=@testcenter.sort{|x| x["name"]}
  end
  
  def labreviewmain
     @testcenter=TestCenter.all
  end
  
  def labreview_write
     @testcenter=TestCenter.all
     @articles=Article.all
  end
  
  def do_write
      @testcenter=TestCenter.all
      a=Article.new
      a.test_center_id = params[:test_center_id]
      index = params[:test_center_id]
      a.title = params[:title]
      a.testcenter = @testcenter.find(params[:test_center_id]).name
      a.content= params[:content]
      a.save
      redirect_to "/home/labreview/#{index}"
  end
  
  def directiontest
    unless params[:origin].nil? || params[:destination].nil?
      @origin = params[:origin].gsub(/\s/, '+')
      @destination = params[:destination].gsub(/\s/, '+')
    end    
  end
  
  def mypage
  end
  
  def embedplace
    render :layout => false
  end
  
end
