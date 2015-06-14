

ActiveRecord::Schema.define do
  create_table :contacts do |table|
    table.column :first_name, :string
    table.column :last_name, :string
    table.column :email, :string
    table.timestamps
  end
   create_table :phones do |t|
    t.references :contact
    t.column :phone_number, :string
    t.timestamps
  end
end


