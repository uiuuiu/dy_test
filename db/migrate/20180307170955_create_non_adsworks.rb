class CreateNonAdsworks < ActiveRecord::Migration[5.0]
  def change
    create_table :non_adsworks do |t|
      t.string :url

      t.references :search_result, null: false

      t.timestamps                 null: false
    end

    add_foreign_key(
      :non_adsworks,
      :search_results,
      column: :search_result_id
    )
  end
end
