class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
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
  after_create :send_welcome_email
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  private
    def send_welcome_email
      UserMailer.with(user: self).welcome_email.deliver_now
    end
  
    def log_before_destroy
      Rails.logger.info "User #{@name} will be destroyed"
    end

    def log_after_destroy
      Rails.logger.info "User #{@name} was destroyed!"
    end
end

#Сформировать ActiveRecord запрос для получения всех постов, написанных модераторами;
