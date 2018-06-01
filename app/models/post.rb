class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :commentators, through: :comments, source: :user
  has_many :seos, as: :seoble, dependent: :destroy
  
  validates :title, presence: true
  validates :title, length: { maximum: 200 }
  validates :body, presence: true
end
