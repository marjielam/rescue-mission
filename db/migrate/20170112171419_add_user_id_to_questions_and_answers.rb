class AddUserIdToQuestionsAndAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user_id, :integer, null: false
    add_column :answers, :user_id, :integer, null: false
  end
end
