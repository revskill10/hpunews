class Message < ActiveRecord::Base
  attr_accessible :category_id, :content, :receiver, :title
  belongs_to :category
end
