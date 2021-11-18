class ReviewAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :review_authors do |t|
      t.string :name
      t.text :biography

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
