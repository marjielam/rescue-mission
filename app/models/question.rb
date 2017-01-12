class Question < ApplicationRecord
  has_many :answers
  belongs_to :user
  # belongs_to :favorite, class_name: :Answer, foreign_key: "favorite_id"

  validates :title, presence: true
  validates :title, length: { minimum: 40 }
  validates :description, presence: true
  validates :description, length: { minimum: 150 }
  validates :user, presence: true
end
