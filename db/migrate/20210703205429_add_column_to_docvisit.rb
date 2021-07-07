class AddColumnToDocvisit < ActiveRecord::Migration[6.1]
  def change
    add_column :docvisits, :doctor_id, :integer
    add_column :docvisits, :user_id, :integer
  end
end
