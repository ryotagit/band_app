class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
end