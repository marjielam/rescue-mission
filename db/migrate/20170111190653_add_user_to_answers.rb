class AddUserToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :user, :integer, null: false
  end
end
