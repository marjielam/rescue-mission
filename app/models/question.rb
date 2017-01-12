class Question < ApplicationRecord
  has_many :answers
  belongs_to :user

  validates :title, presence: true
  validates :title, length: { minimum: 40 }
  validates :description, presence: true
  validates :description, length: { minimum: 150 }
  validates :user, presence: true 
end
