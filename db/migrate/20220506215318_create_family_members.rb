class CreateFamilyMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :family_members do |t|
      t.string :name

      t.timestamps
    end
  end
end
