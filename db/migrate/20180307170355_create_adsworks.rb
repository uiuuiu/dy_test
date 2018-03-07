class CreateAdsworks < ActiveRecord::Migration[5.0]
  def change
    create_table :adsworks do |t|
      t.string :url
      t.string :position

      t.references :search_result, null: false

      t.timestamps                 null: false
    end

    add_foreign_key(
      :adsworks,
      :search_results,
      column: :search_result_id
    )
  end
end
