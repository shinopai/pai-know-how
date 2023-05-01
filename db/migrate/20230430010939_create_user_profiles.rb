class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :name, default: 'ユーザー'
      t.integer :birth_year
      t.integer :birth_month
      t.integer :birth_day
      t.string :image, default: 'img_user.webp'
      t.integer :sex, default: 0
      t.string :tel
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
