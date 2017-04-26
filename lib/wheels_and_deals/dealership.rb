module WheelsAndDeals
  class Dealership
    @@dealerships = []

    def initialize(name)
      @name = name
      @id = @@dealerships.length().+(1)
      @cars = []
    end

    def name
      @name
    end

    def id
      @id
    end

    def cars
      @cars
    end

    def self.all
      @@dealerships
    end

    def save
      @@dealerships.push(self)
    end

    def self.clear
      @@dealerships = []
    end

    def self.find(id)
      @@dealerships.select { |e| e.id == id }.first
    end

    def add_vehicle(vehicle)
      @cars.push(vehicle)
    end
  end
end
