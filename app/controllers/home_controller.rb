class HomeController < ApplicationController
  
  def index
    @lab_db = TestCenter.all
    @point_array = Array.new
    @lab_db.each do |x|
      @point_array.push(x.avg_point.round(0))
    end
  end
  
  def index2
    @lab_db = TestCenter.all
    @point_array = Array.new
    @lab_db.each do |x|
      @point_array.push(x.avg_point.round(0))
    end
  end
  
  def testreview
  end
  
  def labreview
     @testcenter=TestCenter.all
     @allarticle=Article.all
     @posts = Article.paginate(:page => params[:page], :per_page => 5).order('id DESC')
    # @sort=@testcenter.sort{|x| x["name"]}
  end
  
  
  
  def labreview_write
     @testcenter=TestCenter.all
     @articles=Article.all
     @region_selected=@testcenter.where(:region_code => params[:region_code])
  end
  
  def do_write
      @testcenter=TestCenter.all
      a=Article.new
      a.test_center_id = params[:test_center_id]
      index = params[:test_center_id]
      a.title = params[:title]
      a.testcenter = @testcenter.find(params[:test_center_id]).name
      a.content= params[:content]
      a.location_point=params[:location_rating]
      a.facility_point=params[:facility_rating]
      a.computer_point=params[:computer_rating]
      a.avg_point=((a.location_point+a.facility_point+a.computer_point)/3.0).round(2)
      a.save
      
      
      #각 글의 리뷰점수를 각 고사장 리뷰점수에 반영시키는 과정
      location_sum=0
      facility_sum=0
      computer_sum=0
      avg_sum=0
      Article.where(:test_center_id => params[:test_center_id]).each do |x| location_sum+=x.location_point end
      b=TestCenter.find(params[:test_center_id])
      length=Article.where(:test_center_id => params[:test_center_id]).length
      b.location_point=(location_sum / length).round(1)
      b.save
      Article.where(:test_center_id => params[:test_center_id]).each do |x| facility_sum+=x.facility_point end
      b=TestCenter.find(params[:test_center_id])
      length=Article.where(:test_center_id => params[:test_center_id]).length
      b.facility_point=(facility_sum / length).round(1)
      b.save
      Article.where(:test_center_id => params[:test_center_id]).each do |x| computer_sum+=x.computer_point end
      b=TestCenter.find(params[:test_center_id])
      length=Article.where(:test_center_id => params[:test_center_id]).length
      b.computer_point=(computer_sum / length).round(1)
      b.save
      Article.where(:test_center_id => params[:test_center_id]).each do |x| avg_sum+=x.avg_point end
      b=TestCenter.find(params[:test_center_id])
      length=Article.where(:test_center_id => params[:test_center_id]).length
      b.avg_point=(avg_sum / length).round(1)
      b.save
      
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

end
