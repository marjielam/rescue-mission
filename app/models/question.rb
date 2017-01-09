class Question < ApplicationRecord
  # has_many :answers

  validates :title, presence: {message: " -- no title found."}
  validates :description, presence: true
  validates :title, length: { minumum: 40, maximum: 255 }
  validates :description, length: { minimum: 150, maximum: 1000 }
end
