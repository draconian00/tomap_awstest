class Article < ActiveRecord::Base
    belongs_to :test_center
    has_many :replies
end
