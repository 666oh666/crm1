class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :job_type
      t.string :company_name 
      t.string :tel
      t.string :address
      t.string :rep
      t.string :pic
      t.date :date
      t.string :result
      t.text :memo
      
      t.timestamps
    end
  end
end
