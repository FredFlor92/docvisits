class CreateDocvisit < ActiveRecord::Migration[6.1]
  def change
    create_table :docvisits do |t|
      t.string :name
      t.datetime :appointment_date

      t.timestamps
    end
  end
end
