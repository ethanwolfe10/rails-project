class AddBioToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :bio, :string
  end
end
