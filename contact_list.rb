require_relative 'contact'
require_relative 'contact_database'


case ARGV[0]
  when "create"
    STDOUT.puts "creating"
  when "all"
    STDOUT.puts "all"
  when "show"
    STDOUT.puts "showing by id"
  when "find"
    STDOUT.puts "showing by id"
end