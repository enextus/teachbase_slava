#
require_relative 'train'
require_relative 'route'
require_relative 'wagon'
require_relative 'station'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_train'
require_relative 'passenger_wagon'
require_relative 'railway'

BORDERLINE = '-' * 50
NEWLINE = "\n" * 2

#
railway = Railway.new
puts NEWLINE
puts "Добро пожаловать в программу 'Железная дорога'"
puts NEWLINE
#
loop do
  puts "railway.stations: #{railway.stations}\n"
  puts "railway.trains: #{railway.trains}\n"
  puts "railway.wagons: #{railway.wagons}\n"
  puts NEWLINE
  railway.menu_items

  menu_item = gets.chomp
  break if menu_item == '0'

  railway.selected(menu_item)
end
