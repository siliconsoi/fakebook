class News < ActiveRecord::Base
  attr_accessible :status, :user_id
  belong_to :user
end
