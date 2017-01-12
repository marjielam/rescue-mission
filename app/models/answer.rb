class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :description, presence: { message: "for answer cannot be blank"}
  validates :question, presence: true
  validates :description, length: { minimum: 50, message: "for answer is too short (minimum is 50 characters)" }
  validates :user, presence: true
end
