class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :review
      t.references :show, null: false, foreign_key: true
      t.references :review_author, foreign_key: true

      t.timestamps
    end
  end
end
