class ChangeDefaultUserProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_profiles, :birth_year, from: 0, to: nil
    change_column_default :user_profiles, :birth_month, from: 0, to: nil
    change_column_default :user_profiles, :birth_day, from: 0, to: nil
  end
end
