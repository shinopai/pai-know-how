class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :name, default: 'ユーザー'
      t.integer :birth_year, default: 0
      t.integer :birth_month, default: 0
      t.integer :birth_day, default: 0
      t.string :profile_image, default: 'img_user.webp'
      t.integer :sex, default: 0
      t.string :tel, default: '0000000000'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
