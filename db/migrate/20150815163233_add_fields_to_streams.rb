class AddFieldsToStreams < ActiveRecord::Migration
  def change
    add_column :streams, :reached_goal, :boolean
    add_column :streams, :canceled, :boolean
  end
end
