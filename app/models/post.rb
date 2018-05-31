class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :title, length: { maximum: 200 }
  
  validates :body, presence: true
  validates :body, length: { maximum: 1000 }
  
end
