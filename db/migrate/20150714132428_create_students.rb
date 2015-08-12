class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Sex
      t.string :Address1
      t.string :Address2
      t.string :Town
      t.string :County
      t.string :PostCode
      t.string :MainNumber
      t.string :Course
      t.string :Tutor

      t.timestamps null: false
    end
  end
end
