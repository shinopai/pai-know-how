class AddColumnToUserProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :user_profiles, :birth_registered_at, :datetime, after: 'user_id'
  end
end
