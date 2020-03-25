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
                ' 2 - Создать пассажирский поезд.',
                ' 3 - Создать грузовой поезд.',
                ' 4 - Создать пассажирский вагон.',
                ' 5 - Создать грузовой вагон.',
                ' 6 - Посмотреть список вагонов.',
                ' 7 - Прицепить к поезду вагон.',
                ' 8 - Отцепить вагон от поезда.',
                ' 9 - Просмотреть список станций с поездами.',
                '10 - Создавать маршруты и управлять станциями в нем (добавлять, удалять).',
                BORDERLINE,
                '  0 - Для выхода из программы.']
    messages.each { |item| puts item }
  end

  def selected(menu_item)
    puts "Your choice: #{menu_item}" unless menu_item == ''

    case menu_item
    when '1'
      create_station
    when '2'
      create_train_pass
    when '3'
      create_train_cargo
    when '4'
      create_wagon_pass
    when '5'
      create_wagon_cargo
    when '6'
      list_wagons
    when '7'
      attach_wagon
    when '8'
      detach_wagon
    when '9'
      list_stations
    when '10'
      arrive_train
    else
      puts 'Повторите ввод!'
    end
  end

  def data_input(message)
    @args = []
    message.each { |mess| print mess }
    @args << gets.chomp
  end

  #
  def dublicate_name?(arr, name)
    arr.each { |elem| return true if elem.name == name.to_s }
    false
  end

  #
  def create_station
    message = ['Введите название станции:']
    name = data_input(message).first

    return unless name != '' && !dublicate_name?(@stations, name)

    @stations << Station.new(name)
  end

  #
  def dublicate_number?(arr, number)
    arr.each { |elem| return true if elem.number == number.to_s }
    false
  end

  #
  def create_train_pass
    message = ['Введите номер поезда:']
    number = data_input(message).first

    return unless number != '' && !dublicate_number?(@trains, number)

    @trains << PassengerTrain.new(number)
  end

  #
  def create_train_cargo
    message = ['Введите номер поезда:']
    number = data_input(message).first

    return unless number != '' && !dublicate_number?(@trains, number)

    @trains << CargoTrain.new(number)
  end

  # create_wagon_pass
  def create_wagon_pass
    @wagons << PassengerWagon.new
  end

  # create_wagon_cargo
  def create_wagon_cargo
    @wagons << CargoWagon.new
  end

  # list_wagons
  def list_wagons
    puts(@wagons.each_with_index { |elem, index| "#{index + 1}. #{elem}" })
  end

  # do_select_train
  def choose_a_train
    message = @trains
    message.each_with_index { |elem, index| puts "#{index + 1}. #{elem}" }

    message = ['Выбрать поезд: ']
    index = data_input(message).first.to_i - 1
    @trains[index]
  end

  # attach_wagon
  def attach_wagon
    train = choose_a_train

    suitable_wagon = @wagons.select { |wagon| wagon.type == train.type }.first

    return if suitable_wagon.nil?

    train.attach_wagon(suitable_wagon)
    @wagons.delete(suitable_wagon)
  end

  # detach_wagon
  def detach_wagon
    #
  end

  # list_stations
  def list_stations
    @stations.each_with_index { |elem, index| puts "#{index + 1}. #{elem}; Trains: #{elem.trains}" }
  end

  def arrive_train
    #
  end
end
