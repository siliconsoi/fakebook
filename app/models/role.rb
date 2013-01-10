class Role < ActiveRecord::Base
  attr_accessible :name, :role
  has_many :role_ids
end
