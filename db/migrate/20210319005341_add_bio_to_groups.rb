class AddBioToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :bio, :text
  end
end
