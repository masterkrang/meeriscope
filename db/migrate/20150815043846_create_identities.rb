class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.belongs_to :user, index: true
      t.string :uid
      t.string :provider
      t.string :profile_link
      t.string :profile_image

      t.timestamps null: false
    end
  end
end
