class Comic < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :story, presence: true
  validates :review, presence: true
end
