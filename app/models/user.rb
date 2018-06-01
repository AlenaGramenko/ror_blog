class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :seos, dependent: :destroy
  
  has_many :commented_posts, through: :comments,
                             source: :commentable,
                             source_type: :Post

  has_many :commented_users, through: :comments,
                             source: :commentable,
                             source_type: :User
                             
  has_many :commented_users, through: :comments,
                             source: :commentable,
                             source_type: :User

  has_many :post_seos, through: :seos,
                             source: :seoble,
                             source_type: :Post
                             
  has_many :user_seos, through: :seos,
                             source: :seoble,
                             source_type: :User
                             
                             
  before_destroy :log_before_destroy
  after_destroy  :log_after_destroy
  
  private
  
    def log_before_destroy
      Rails.logger.info "User #{@name} will be destroyed"
    end

    def log_after_destroy
      Rails.logger.info "User #{@name} was destroyed!"
    end
end

#Сформировать ActiveRecord запрос для получения всех постов, написанных модераторами;
