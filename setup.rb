require 'pry' 
require 'active_record'
require_relative 'contact'
# require_relative 'contact_list'
require_relative 'phonenumber'

# Output messages from AR to STDOUT
# ActiveRecord::Base.logger = Logger.new(STDOUT)


ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'dbl01dhuenecbc',
  username: 'bqjsghfauqlbkv',
  password: 'twZcyMXLTpFC_zj40JuShLOWTE',
  host: 'ec2-50-19-233-111.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)


# ActiveRecord::Schema.define do
#   drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   drop_table :phones if ActiveRecord::Base.connection.table_exists?(:phones)
#   create_table :contacts do |table|
#     table.column :first_name, :string
#     table.column :last_name, :string
#     table.column :email, :string
#     table.timestamps
#   end
#    create_table :phones do |t|
#     t.references :contact
#     t.column :phone_number, :string
#     t.timestamps
#   end
# end


