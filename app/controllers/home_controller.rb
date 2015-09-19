class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:do_write, :labreview_write, :do_write_reply, :labreview, :modify_review]
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
  
  def do_write_reply
      my_reply=Reply.new
      my_reply.article_id=params[:article_id]
      my_reply.content=params[:reply_content]
      my_reply.author=current_user.nickname
      my_reply.save
      
      redirect_to :back
  end
  
  def do_like
      my_like=Like.new
      my_like.article_id=params[:article_id]
      my_like.click_like_person=current_user.email
      my_like.save
      
      redirect_to :back
  end
  
  def do_write
      @testcenter=TestCenter.all
      a=Article.new
      a.test_center_id = params[:test_center_id]
      index = params[:test_center_id]
      a.title = params[:title]
      a.testcenter = @testcenter.find(params[:test_center_id]).name
      a.content= params[:content]
      a.author=current_user.nickname
      
      a.location_point=params[:location_rating]
      a.location_content=params[:location_content]
      
      a.facility_point=params[:facility_rating]
      a.facility_content=params[:facility_content]
      
      a.computer_point=params[:computer_rating]
      a.computer_content=params[:computer_content]
      
      a.avg_point=((a.location_point+a.facility_point+a.computer_point)/3.0).round(1)
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
  
  def show_review
      @article=Article.find(params[:id])
      @testcenter=TestCenter.all
    
  end
  
  def modify_review
     @testcenter=TestCenter.all
     @articles=Article.all
    
  end
  
  def do_modify
      
      @testcenter=TestCenter.all
      a=Article.find(params[:id])
      a.test_center_id = params[:test_center_id]
      index = params[:id]
      a.title = params[:title]
      a.testcenter = @testcenter.find(params[:test_center_id]).name
      a.content= params[:content]
      a.author=current_user.nickname
      
      a.location_point=params[:location_rating]
      a.location_content=params[:location_content]
      
      a.facility_point=params[:facility_rating]
      a.facility_content=params[:facility_content]
      
      a.computer_point=params[:computer_rating]
      a.computer_content=params[:computer_content]
      
      a.avg_point=((a.location_point+a.facility_point+a.computer_point)/3.0).round(1)
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
      
      redirect_to "/home/show_review/#{index}"
  end
  
  def do_delete
      something = Article.find(params[:id])
      index = something.test_center_id
      something.destroy
      redirect_to "/home/labreview/#{index}"
  end
  def mypage
  end

  def region_main
      @testcenter=TestCenter.all
  end
  
end