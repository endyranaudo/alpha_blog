class User < ApplicationRecord
  #BEFORE_SAVE
  before_save { self.email = email.downcase} 
  
  #VALIDATIONS
  validates :username, presence: true,  uniqueness: { case_sensitive: false }, length: {minimum: 3, maximum: 35 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }
  
  #ASSOCIATIONS
  has_many :articles
  #BCRYPT
  has_secure_password
end