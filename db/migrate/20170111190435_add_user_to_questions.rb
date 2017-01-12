class AddUserToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :user, :integer, null: false
  end
end
