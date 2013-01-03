class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter, :news
  belongs_to :news
end
