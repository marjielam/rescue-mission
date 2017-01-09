class Answer < ApplicationRecord
  belongs_to :question

  validates :description, presence: true
  validates :question, presence: true
  validates :description, length: { minimum: 50, maximum: 1000 }
end
