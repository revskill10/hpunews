class Category < ActiveRecord::Base
  attr_accessible :name
  validate :name, presence: true
  has_many :messages
end
