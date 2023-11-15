

Напишем свой класс
```
class Bus
  def initialize(params)
    # переменная с @ - переменная класса
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print "
      Vehicle: #{@type.upcase}\n
      Color: #{@color.upcase}\n
      Doors: #{@doors_number}\n
      Wheels number: #{@wheels_number}\n
      Wheels radius: #{@wheels_radius}\n
    "
  end
end

Bus.new(color: 'red', wheels_radius: 18)
```

#### Доступ к атрибутам экземпляра класса

```
bus = Bus.new(color: 'red', wheels_radius: 18)
# bus.color  undefined method `color'
bus.color = 'green'

class Bus
  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def color
    @color
  end

  def color=(color)
    @color = color
  end

  def print_string
    print "
      Vehicle: #{@type.upcase}\n
      Color: #{@color.upcase}\n
      Doors: #{@doors_number}\n
      Wheels number: #{@wheels_number}\n
      Wheels radius: #{@wheels_radius}\n
    "
  end
end

class Bus
  # Создание методов-геттеров
  attr_reader :color, :doors_number, :type, :wheels_number, :wheels_radius
  # Создание методов-сеттеров
  attr_writer :color, :doors_number, :type, :wheels_number, :wheels_radius

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print "
      Vehicle: #{type.upcase}\n
      Color: #{color.upcase}\n
      Doors: #{doors_number}\n
      Wheels number: #{wheels_number}\n
      Wheels radius: #{wheels_radius}\n
    "
  end
end

bus = Bus.new(color: 'red', wheels_radius: 18)
bus.color
bus.color = 'green'
```

#### Методы класса

```
class Bus
  def self.bus?
    true
  end
end

Bus.bus? # true
```

#### Разграничение доступа к методам

```
class Bus
  # Геттеры и сеттеры
  attr_accessor :color, :doors_number, :type, :wheels_number, :wheels_radius

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(type)}\n
      Color: #{upcase_attribute(color)}\n
      Doors: #{upcase_attribute(doors_number)}\n
      Wheels number: #{upcase_attribute(wheels_number)}\n
      Wheels radius: #{upcase_attribute(wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end
end

bus = Bus.new(color: 'red', wheels_radius: 18)
bus.print_string
bus.bus_string(bus)
bus.bus_string_of(bus)
```

#### Алиасы

```
class Bus
  attr_accessor :color

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end
  alias to_s print_string

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end
end

bus = Bus.new(color: 'red', wheels_radius: 18)
bus.to_s
bus.to_string
```

#### Наследование

```
class Bus
  attr_accessor :color

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end

  alias to_s print_string
end

class OfficeBus < Bus
  attr_reader :people_place

  def initialize(params)
    super
    @people_place = params[:people_place]
  end

  def has_people_place?
    people_place
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      People place: #{@people_place ? 'YES' : 'NO'}
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end
end

class Bus
end

class OfficeBus < Bus
end

OfficeBus.new(color: 'red', wheels_radius: '18', people_place: true).to_s
```

#### Модули

```
# include

module Colorful
  COLORS = {
    black: '#000000',
    red: '#FF0000',
    white: '#FFFFFF',
  }

  def color_code(color)
    COLORS[color.to_sym]
  end
end

class Car
  def car?
    true
  end
end

class User
  # include расширяет экземпляры класса
  # Модуль используется как mixin
  # Перезаписывает методы класса, если есть с таким же именем
  include Colorful
  #...
end

class Bus
  attr_accessor :color

  include Colorful

  def initialize(params)
    @color = params[:color]
    @doors_number = 4
    @type = 'Bus'
    @wheels_number = 4
    @wheels_radius = params[:wheels_radius]
  end

  def print_string
    print bus_string_of(self)
  end

  def bus_string_of(bus)
    bus.bus_string
  end

  protected

  def bus_string
    "
      Vehicle: #{upcase_attribute(@type)}\n
      Color: #{upcase_attribute(@color)}\n
      Doors: #{upcase_attribute(@doors_number)}\n
      Wheels number: #{upcase_attribute(@wheels_number)}\n
      Wheels radius: #{upcase_attribute(@wheels_radius)}\n
    "
  end

  private

  def upcase_attribute(attribute)
    attribute.to_s.upcase
  end

  alias to_s print_string
end

bus = Bus.new(color: 'red', wheels_radius: '18')
bus.color_code(bus.color)

## extend ##

module Colorful
  def colorized?
    true
  end
end

class Bus
  # extend расширяет класс
  extend Colorful

  #...
end

Bus.colorized?
```
#### Вызовы классов и модулей

```
# Короткая запись - Books::HarryPotter.glasses
module Books
  module HarryPotter
    def glasses
    end
  end

  # Вызывается модуль Books::HarryPotter
  HarryPotter::glasses
  # Вызов метода из модуля HarryPotter (который находится глобально)
  ::HarryPotter::magic
end

module HarryPotter
  def magic
  end
end

### method_missing ###

def method_missing(m, *args, &block)
  #...
end

# Стараемся использовать отдельный файл для каждого класса
# Один модуль - один файл
```

https://ru.hexlet.io/courses/ruby-basics/lessons/oop/theory_unit


--------------


Один Класс. Несколько Методов. Все понятно
Маленький Класс. Один Метод
новички в ООП обычно довольно легко понимают концепцию класс-объект на примере одного класса с методами, которые вызываются на объекте
к примеру напишем простой класс Car:

# ./car.rb
class Car
  def beep
    puts 'beep beep'
  end
end
переходим в irb:

$ irb -r ./car.rb
2.5.1 :001 > car = Car.new
 => #<Car:0x00000000012c1900>
2.5.1 :002 > car.beep
beep beep
 => nil
2.5.1 :003 >
класс загружен, объект создан, метод вызван у объекта, результат совпадает с ожиданиями… отлично!

Метод initialize
также обычно не вызывает сложностей в понимании и некоторое усложнение класса
например:
в классе может быть метод initialize, который принимает аргументы и присваивает их значения инстанс-переменным

# ./car.rb
class Car
  def initialize(number)
    @number = number
  end
def beep
    puts 'beep beep'
  end
end
теперь при инициализации объекта мы должны передать в аргументах метода .new номер и мы можем увидеть в irb, что этот номер присвоен соответствующей переменной объекта класса Car

$ irb -r ./car.rb
2.5.1 :001 > car = Car.new(123)
 => #<Car:0x0000000000e99b70 @number=123>
2.5.1 :002 >
опять же все понятно и прозрачно

Добавление getter и setter
можно добавить еще один аттрибут и пару геттер-сеттер к нему
можно даже устанавливать в методе initializeзначение по умолчанию для этого нового аттрибута
пусть автомобиль имеет аттрибут “цвет” и пусть при создании нового автомобиля его цвет устанавливается в значение “белый”
при этом у автомобиля есть методы, с попощью которых можно узнать цвет или поменять его (как в примере ниже):

# ./car.rb
class Car
  def initialize(number)
    @number = number
    @color = 'white'
  end
def beep
    puts 'beep beep'
  end
def color=(color)
    @color = color
  end
def color
    @color
  end
end
и в irb мы можем проверить нашу новую функциональность:

$ irb -r ./car.rb
2.5.1 :001 > car = Car.new(123)
 => #<Car:0x0000000001cad4a0 @number=123, @color="white">
2.5.1 :002 > car.color
 => "white"
2.5.1 :003 > car.color = 'red'
 => "red"
2.5.1 :004 > car.color
 => "red"
2.5.1 :005 >
все работает, как и было задумано

геттер и сеттер, чтобы не быть многословными можно переписать с помощью встроенного метода Руби:

# ./car.rb
class Car
  attr_accessor :color
def initialize(number)
    @number = number
    @color = 'white'
  end
def beep
    puts 'beep beep'
  end
end
и все работает, как прежде:

$ irb -r ./car.rb
2.5.1 :001 > car = Car.new(123)
 => #<Car:0x0000000001628c10 @number=123, @color="white">
2.5.1 :002 > car.color
 => "white"
2.5.1 :003 > car.color = 'red'
 => "red"
2.5.1 :004 > car.color
 => "red"
2.5.1 :005 >
Методы принимающие аргументы
немного усложним )

предположим по заданию наш автомобиль должен обладать следующими качествами:

“Имеет номер, который указывается при создании”
“Имеет цвет, при создании цвет устанавливается в значение ‘white’”
“Может выводить в консоли ‘beep beep’”
“Может возвращать цвет, может менять цвет”
“Знает имена, допущенных к управлению водителей”
“Может добавлять имена водителей в список имен водителей”
“Может возвращать список имен водителей”
“Может выводить список имен водителей”
мы здесь должны добавить функциональность, связанную с именами водителей
в коде это может выглядеть вот так:

# ./car.rb
class Car
  attr_accessor :color
  attr_reader :drivers_names
def initialize(number)
    @number = number
    @color = 'white'
    @drivers_names = []
  end
def beep
    puts 'beep beep'
  end
def add_driver(name)
    @drivers_names << name
  end
def show_drivers
    @drivers_names.each { |name| puts name }
  end
end
что нового в нашем классе ?

чтобы выполнить пункт ТЗ “Знает имена, допущенных к управлению водителей” в классе Car появилась еще одна инстанс-переменная и ридер (геттер) для нее
эта переменная инициализируется со значением “пустой массив”
в качестве реализации пункта “Может добавлять имена водителей в список имен водителей” добавился метод add_driver(name), который добавляет элементы в массив, храняшийся в @drivers_names
наконец метод show_drivers реализует пункт “Может выводить список имен водителей”
все работает, как и было задумано, в чем можно легко убедиться зайдя в irb:

$ irb -r ./car.rb
2.5.1 :001 > car = Car.new(123)
 => #<Car:0x0000000001b789e0 @number=123, @color="white", @drivers_names=[]>
2.5.1 :002 > car.add_driver('Bill')
 => ["Bill"]
2.5.1 :003 > car.drivers_names
 => ["Bill"]
2.5.1 :004 > car.show_drivers
Bill
 => ["Bill"]
2.5.1 :005 > car.add_driver('Mark')
 => ["Bill", "Mark"]
2.5.1 :006 > car.drivers_names
 => ["Bill", "Mark"]
2.5.1 :007 > car.show_drivers
Bill
Mark
 => ["Bill", "Mark"]
2.5.1 :008 >
далее начинается часть, на которой у многих новичков возникают вопросы

Взаимодействие двух классов
Классы взаимодействуют между собой с помощью объектов
чтобы понять, как объекты разных классов взаимодействуют друг с другом в ООП парадигме, сделаем для начала две вещи:

первое:
давайте добавим класс Driver
и пусть задание (ТЗ) для него звучит следующим образом

класс Водитель:

“Имеет имя, которое указывается при создании”
“Может возвращать имя”
второе:
изменим ТЗ для класса Car, чтобы оно теперь выглядело как описано ниже

класс Автомобиль:

“Имеет номер, который указывается при создании”
“Может возвращать номер”
“Имеет цвет, при создании цвет устанавливается в значение ‘white’”
“Может возвращать цвет, может менять цвет”
“Может выводить в консоли ‘beep beep’”
“Знает допущенных к управлению водителей”
“Может добавлять водителей в список водителей”
“Может возвращать список водителей”
“Может выводить список имен водителей”
начнем мы с изменения уже существующего класса Car
что изменилось в ТЗ?

“Может возвращать номер” означает, что нужно добавить метод, который возвращает значение инстанс-переменной, т.е. геттер
это легко реализуемо добавлением в класс одной строчки:
attr_reader :number
“Знает допущенных к управлению водителей” vs. “Знает имена, допущенных к управлению водителей”…
что означает это почти незаметное изменение в ТЗ?
оно означает, что теперь мы должны хранить в инстанс-переменной объекта car* не строки, а что-то другое… и это “другое” - это объект класса Driver
другими словами: объект класса Car должен хранить в своей переменной объекты класса Driver
эта модификация не требует больших изменений, разве что переименования переменной drivers_names в drivers (для простоты чтения и понимания кода):
вместо
attr_reader :drivers_names
теперь стоит написать
attr_reader :drivers
и аналогичным образом поменять имя переменной в initialize: c @drivers_names, на @drivers
поменяв имя ридера мы также выполнили пункт “Может возвращать список водителей”
“Может добавлять водителей в список водителей” vs. “Может добавлять имена водителей в список имен водителей”
здесь изменения следуют той же логике, что и в предыдущем пункте — мы просто правим метод так, чтобы речь уже шла не об операциях со строкой, а об операциях с объектом класса Driver
вместо
def add_driver(name) @drivers_names << name end
напишем
def add_driver(driver) @drivers << driver end
Следуя той же логике меняем метод show_drivers, теперь он будет выглядеть так:
def show_drivers @drivers.each { |driver| puts driver.name } end
здесь стоит обратить внимание на следующий момент, который нередко бывает не совсем ясен студентам
если раньше мы перебирали элементы массива, являвшиеся строками и выводили их по очереди, то в новом методе мы перебираем элементы, каждый из которых — объект класса Driver
этих объектов не существует в природе на момент написания класса Car
мы даже возможно еще не начинали писать класс Driver**, но у нас есть ТЗ и в ТЗ сказано:
у объектов класса Driver должнен быть аттрибут “имя”
и вторым пунктом ТЗ: “Может возвращать имя”
именно поэтому мы и используем в блоке итератора вызов driver.name
* (замечание к пункту 2) название переменной, хранящей объект может быть любым, речь идет об оъектах класса Car

** (замечание к пунтку 4) при написании кода можно пойти разными путями:
1) если держать какие-то свойства класса в уме, пока пишешь другой класс сложно, то можно писать два класса параллельно, и двигаться по пунктам
2) можно, предвосхищая написание класса, уже на этом этапе использовать его описанные в ТЗ аттрибуты и методы

со всеми исправлениями класс Car будет выглядеть следующим образом:

# ./car.rb
class Car
  attr_accessor :color
  attr_reader :drivers, :number
def initialize(number)
    @number = number
    @color = 'white'
    @drivers = []
  end
def beep
    puts 'beep beep'
  end
def add_driver(driver)
    @drivers << driver
  end
def show_drivers
    @drivers.each { |driver| puts driver.name }
  end
end
перейдем к классу Driver
согласно ТЗ он должен выглядеть так:

# ./driver.rb
class Driver
  attr_reader :name
def initialize(name)
    @name = name
  end
end
в этом коде реализованы пункты

“Имеет имя, которое указывается при создании”
“Может возвращать имя”
проверим в irb:

$ irb -r ./driver.rb -r ./car.rb
2.5.1 :001 > driver1 = Driver.new 'Bill'
 => #<Driver:0x0000000002801090 @name="Bill">
2.5.1 :002 > driver1.name
 => "Bill"
2.5.1 :003 > driver2 = Driver.new 'Mark'
 => #<Driver:0x00000000027f8800 @name="Mark">
2.5.1 :004 > driver2.name
 => "Mark"
2.5.1 :005 > car1 = Car.new 123
 => #<Car:0x0000000002724de8 @number=123, @color="white", @drivers=[]>
2.5.1 :006 > car1.beep
beep beep
 => nil
2.5.1 :007 > car1.color
 => "white"
2.5.1 :008 > car1.drivers
 => []
2.5.1 :009 > car1.add_driver(driver1)
 => [#<Driver:0x0000000002801090 @name="Bill">]
2.5.1 :010 > car1.drivers
 => [#<Driver:0x0000000002801090 @name="Bill">]
2.5.1 :011 > car1.add_driver(driver2)
 => [#<Driver:0x0000000002801090 @name="Bill">, #<Driver:0x00000000027f8800 @name="Mark">]
2.5.1 :012 > car1.drivers
 => [#<Driver:0x0000000002801090 @name="Bill">, #<Driver:0x00000000027f8800 @name="Mark">]
2.5.1 :013 > car1.show_drivers
Bill
Mark
 => [#<Driver:0x0000000002801090 @name="Bill">, #<Driver:0x00000000027f8800 @name="Mark">]
2.5.1 :014 >
все методы работают именно так, как и ожидалось

Чуть больше взаимодействий
но давайте вернемся к реальности )))
автомобили ничего не знают про своих владельцев!


изменим ТЗ так, чтобы переложить бремя знания с автомобиля, на водителя

класс Автомобиль:

“Имеет номер, который указывается при создании”
“Может возвращать номер”
“Может иметь на двери надпись”
“Может устанавливать надпись на двери в значение равное имени владельца”
“Может возвращать надпись на двери”
“Имеет цвет, при создании цвет устанавливается в значение ‘white’”
“Может возвращать цвет, может менять цвет”
“Может выводить в консоли ‘beep beep’”
класс Водитель

“Имеет имя, которое указывается при создании”
“Может возвращать имя”
“Может покупать и владеть автомобилями”
“При покупке нового автомобиля наносит на его дверь свое имя”
“Может возвращать список автомобилей, которыми владеет”
мы убрали из класса Автомобиль все пункты, связанные со знаниями о водителях, и добавили автомобилю необязательный аттрибут “надпись на двери”…
“может устанавливать”, “может возвращать” очевидно озаначают необходимость добавить соотвествующие методы

# ./car.rb
class Car
  attr_accessor :color
  attr_reader :door_title, :number
def initialize(number)
    @number = number
    @color = 'white'
  end
def beep
    puts 'beep beep'
  end
def change_door_title(driver)
    @door_title = driver.name if driver.cars.include?(self)
  end
end
в методе change_door_title мы учли требование пункта “Может устанавливать надпись на двери в значение равное имени владельца”
благодаря проверке, касающейся “владения автомобилем”, надпись на двери изменится тогда и только тогда, когда переданный в метод объект (водитель) является владельцем текущего авто (внутри метода переменная self ссылается на объект класса Car, у которого этот метод был вызван)
другими словами:
автомобиль у которого вызван метод change_door_title должен находится в списке @cars у водителя, имя которого мы хотим нанести на дверь
что может означать следующий пункт в классе Водитель: “Может покупать и владеть автомобилями” ?
он должен означать, что объект класса Driver, видимо должен хранить инстанс-переменную @cars (“владеть автомобилями”) и в классе должен быть метод buy_car, который будет добавлять автомобили в список автомобилей, которыми “владеет водитель”
здесь нужно обратить внимание на то, что в списке, т.е. в переменной, которая хранит в себе коллекцию (массив в нашем случае), должны храниться не номера автомобилей, а объекты класса Car (точнее ссылки на эти объекты)
как легко догадаться строчка “Может возвращать список автомобилей, которыми владеет” должна означать необходимость геттера для переменной @cars
с учетом этих пунктов, класс нужно переписать так:

# ./driver.rb
class Driver
  attr_reader :name, :cars
def initialize(name)
    @name = name
    @cars = []
  end
def buy_car(car)
    @cars << car
  end
end
теперь посмотрим на фразу “При покупке нового автомобиля наносит на его дверь свое имя”… она должна означать, что в методе buy_car (в классе Driver) объект класса Car, переданный в метод, должен быть изменен
а именно, должно измениться содержание инстанс-переменной @door_title
для этого у нас в классе Car есть метод change_door_title
получается, что метод buy_car нужно дополнить следующим образом:

def buy_car(car)
  @cars << car
  car.change_door_title(driver)
end
но откуда возьмется переменная driver ?
можно конечно передать объект в аргументах, вот так: driver.buy_car(car, driver)
однако такое решение будет хоть и работающим, но не верным
вспомним, что при вызове вида driver.buy_car(car) внутри метода buy_car на объект driver (тот самый у которого вызван метод) ссылается переменная self
тогда метод можно переписать следующим образом:

def buy_car(car)
  @cars << car
  car.change_door_title(self)
end
после редактирования, класс у нас выглядит следующим образом:

# ./driver.rb
class Driver
  attr_reader :name, :cars
def initialize(name)
    @name = name
    @cars = []
  end
def buy_car(car)
    @cars << car
    car.change_door_title(self)
  end
end
проведем испытания в irb
создаем автомобили

$ irb -r ./driver.rb -r ./car.rb
2.5.1 :001 > car1 = Car.new 123
 => #<Car:0x0000000000b80628 @number=123, @color="white">
2.5.1 :002 > car2 = Car.new 345
 => #<Car:0x000000000088a720 @number=345, @color="white">
создаем водителей

2.5.1 :003 > bill = Driver.new 'Bill'
 => #<Driver:0x00000000008861c0 @name="Bill", @cars=[]>
2.5.1 :004 > mark = Driver.new 'Mark'
 => #<Driver:0x0000000000b7c1e0 @name="Mark", @cars=[]>
проверяем надпись у первого авто и список авто у Билла

2.5.1 :005 > car1.door_title
 => nil
2.5.1 :006 > bill.cars
 => []
надписи нет, автомобилей тоже )

Билл покупает первый автомобиль и на двери авто появляется его имя

2.5.1 :007 > bill.buy_car(car1)
 => "Bill"
2.5.1 :008 > bill.cars
 => [#<Car:0x0000000000b80628 @number=123, @color="white", @door_title="Bill">]
2.5.1 :009 > car1.door_title
 => "Bill"
пытаемся изменить надпись на двери автомобиля Билла

2.5.1 :010 > car1.change_door_title(mark)
 => nil
2.5.1 :011 > car1.door_title
 => "Bill"
безуспешно — надпись не поменялась, потому что Марк не является владельцем автомобиля car1

Марк покупает авто car2

2.5.1 :012 > mark.cars
 => []
2.5.1 :013 > car2.door_title
 => nil
2.5.1 :014 > mark.buy_car(car2)
 => "Mark"
2.5.1 :015 > mark.cars
 => [#<Car:0x000000000088a720 @number=345, @color="white", @door_title="Mark">]
2.5.1 :016 > car2.door_title
 => "Mark"
все работает именно так, как и было задумано!



https://medium.com/@iamrealnurs/ruby-%D0%BE%D0%BE%D0%BF-%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D1%8B-%D0%BE%D0%B1%D1%8A%D0%B5%D0%BA%D1%82%D1%8B-%D0%B2%D0%B7%D0%B0%D0%B8%D0%BC%D0%BE%D0%B4%D0%B5%D0%B9%D1%81%D1%82%D0%B2%D0%B8%D1%8F-69e70ea9112a
