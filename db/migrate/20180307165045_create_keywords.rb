class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.string     :name,     null: false, default: ""
      t.references :user,     null: false

      t.timestamps            null: false
    end

    add_foreign_key(
      :keywords,
      :users,
      column: :user_id
    )
  end
end
