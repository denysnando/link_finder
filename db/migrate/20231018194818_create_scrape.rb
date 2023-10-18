class CreateScrape < ActiveRecord::Migration[7.1]
  def change
    create_table :scrapes do |t|
      t.references :user
      t.string :name
      t.string :url
      t.integer :url_counter, default: 0

      t.timestamps
    end
  end
end
