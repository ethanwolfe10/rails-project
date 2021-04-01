class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :display_name
      t.text :bio

      t.timestamps
    end
  end
end
