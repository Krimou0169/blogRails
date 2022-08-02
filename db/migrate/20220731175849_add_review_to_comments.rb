class AddReviewToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :review, :integer
  end
end
