class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :organizer, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
