class AddFavoriteToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :favorite_id, :integer
  end
end
