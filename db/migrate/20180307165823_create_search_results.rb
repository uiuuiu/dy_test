class CreateSearchResults < ActiveRecord::Migration[5.0]
  def change
    create_table :search_results do |t|
      t.integer :total_top_ads
      t.integer :total_bot_ads
      t.integer :total_ads
      t.integer :total_non_ads
      t.integer :total_number_of_links
      t.integer :total_of_search_results
      t.text :html_content

      t.timestamps              null: false

      t.references :keyword,    null: false
    end

    add_foreign_key(
      :search_results,
      :keywords,
      column: :keyword_id
    )
  end
end
