# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

file = File.open('app/assets/csv/memory-tech-challenge-data.csv', 'r')

OrderLine.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(OrderLine)

i = 1

CSV.foreach(file.path, headers: true) do |row|
	OrderLine.create(row.to_h)
	puts "#{i} order line created"
	i = i + 1
	#break if i==10
end

