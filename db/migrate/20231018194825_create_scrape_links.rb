class CreateScrapeLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :scrape_links do |t|
      t.references :scrape
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
