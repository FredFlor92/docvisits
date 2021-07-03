class CreateDocvisit < ActiveRecord::Migration[6.1]
  def change
    create_table :docvisits do |t|
      t.string :name
      t.string :sex
      t.date :date_of_birth
      t.date :appointment_date
      t.time :appointment_time
      

      t.timestamps
    end
  end
end
