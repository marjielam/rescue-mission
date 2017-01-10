class Answer < ApplicationRecord
  belongs_to :question

  validates :description, presence: { message: "for answer cannot be blank"}
  validates :question, presence: true
  validates :description, length: { minimum: 50, message: "for answer is too short (minimum is 50 characters)" }
end
