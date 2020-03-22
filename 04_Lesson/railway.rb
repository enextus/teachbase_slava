

class Railway
  attr_reader :routes, :trains, :wagons, :stations
  def initialize
    @routes = []
    @trains = []
    @wagons = []
    @stations = []
  end

  #
  def menu_items
    messages = ['Выберите действие, введя номер из списка: ',
                BORDERLINE,
                ' 1 - Создать станцию.',
                ' 2 - Создать поезд.',
                ' 3 - Создать вагон.',
                ' 4 - Посмотреть список вагонов.',
                ' 5 - Прицепить к поезду вагон из пула вагонов.',
                ' 6 - Отцепить вагон от поезда в пул вагонов.',
                ' 7 - Поместить поезд на станцию.',
                ' 8 - Посмотреть список станций.',
                ' 9 - Посмотреть список поездов на станции.',
                ' 10 - Создать маршрут.',
                ' 11 - Добавитъ станцию в маршрут.',
                ' 12 - Удалитъ станцию в маршруте.',
                ' 13 - Удалить маршрут.',
                ' 14 - Назначать маршрут поезду.',
                ' 15 - Переместить поезд по маршруту вперед.',
                ' 16 - Переместить поезд по маршруту назад.',
                ' 17 - Посмотреть список созданных маршрутов.',
                BORDERLINE,
                '  0 - Для выхода из программы.']
    messages.each { |item| puts item }
  end

  #
  def selected(menu_item)
    puts "Your choice: #{menu_item}" if menu_item != ''
  end

  def data_input(message)
    @args = []
    message.each { |mess| print mess }
    @args << gets.chomp
  end

  # puts @stations.any?
  def dublicate?(arr, name)
    arr.each { |elem| return true if elem.name == name.to_s }
    false
  end


  def create_station
    message = ['Введите название станции:']
    name = data_input(message).first

    return if dublicate?(@stations, name)

    @stations << Station.new(name)
  end

  def create_train_pass
    message = ['Введите номер поезда:']
    number = data_input(message).first
    @trains << PassengerTrain.new(number)
  end

  def create_train_cargo
    message = ['Введите номер поезда:']
    number = data_input(message).first
    @trains << CargoTrain.new(number)
  end

  def create_wagon_pass
    @wagons << PassengerWagon.new
  end

  def create_wagon_cargo
    @wagons << CargoWagon.new
  end

  def list_wagons
    puts @wagons
  end

  def attach_wagon
    message = @trains
    message.each_with_index { |mess, index| puts index + 1, mess }
    train = data_input(message).first
    puts train
  end

  def selected(menu_item)
    puts "Your choice: #{menu_item}" if menu_item != ''

    case menu_item
    when '1'
      create_station
    when '2'
      create_train
    when '3'
      create_wagon
    when '4'
      list_wagons
    when '5'
      attach_wagon
    when '6'
      detach_wagon
    when '7'
      link_to_station
    when '8'
      list_stations
    when '9'
      list_trains_on_station
    when '10'
      create_route
    when '11'
      add_station_in_to_route
    when '12'
      delete_station_in_route
    when '13'
      delete_route
    when '14'
      assign_route_to_train
    when '15'
      move_train_forward_by_route
    when '16'
      move_train_backward_by_route
    when '17'
      show_all_routes
    else
      puts 'Повторите ввод!'
    end
  end
end
