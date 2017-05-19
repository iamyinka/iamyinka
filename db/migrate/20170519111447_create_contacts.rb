class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :budget
      t.string :startdate
      t.text :description

      t.timestamps
    end
  end
end
