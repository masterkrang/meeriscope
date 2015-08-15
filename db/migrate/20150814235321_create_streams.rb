class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :url
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :goal, :precision => 8, :scale => 2
      t.string :category

      t.timestamps null: false
    end
  end
end
