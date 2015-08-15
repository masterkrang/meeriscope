class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :stream_id
      t.integer :user_id
      t.string :customer_token
      t.boolean :paid

      t.timestamps null: false
    end
    add_index :tickets, [:stream_id, :user_id], unique: true
  end
end
