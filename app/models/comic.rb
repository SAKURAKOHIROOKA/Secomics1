class Comic < ApplicationRecord
  belongs_to :user
  has_many :post_comments. dependent: :destroy
  
  validates :title, presence: true
  validates :story, presence: true
  validates :review, presence: true
end
