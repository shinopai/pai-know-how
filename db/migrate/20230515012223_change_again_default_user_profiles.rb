class ChangeAgainDefaultUserProfiles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_profiles, :name, from: 'ユーザー', to: 'user'
    change_column_default :user_profiles, :birth_year, from: 0, to: 1900
    change_column_default :user_profiles, :birth_month, from: 0, to: 1
    change_column_default :user_profiles, :birth_day, from: 0, to: 1
  end
end
