class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :studio
      t.integer :number_of_seasons
      t.integer :year
      t.integer :episodes

      t.timestamps
    end
  end
end
