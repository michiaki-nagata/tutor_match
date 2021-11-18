class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :message_id
      t.text :text
      t.string :sender

      t.timestamps
    end
  end
end
