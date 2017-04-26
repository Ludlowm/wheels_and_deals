require 'spec_helper'

RSpec.describe(WheelsAndDeals::Dealership) do
  before(:each) do
    WheelsAndDeals::Dealership.clear()
    @deal = WheelsAndDeals::Dealership.new("Bob's Used Cars")
  end

  describe('#name') do
    it("returns the name of the dealership") do
      expect(@deal.name()).to(eq("Bob's Used Cars"))
    end
  end

  describe('#id') do
    it("returns the id of the dealership") do
      expect(@deal.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it("initially returns an empty array of cars for the dealership") do
      expect(@deal.cars()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a dealership to the array of saved dealerships") do
      @deal.save()
      expect(WheelsAndDeals::Dealership.all()).to(eq([@deal]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(WheelsAndDeals::Dealership.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved dealerships") do
      WheelsAndDeals::Dealership.new("Bob's Used Cars").save()
      WheelsAndDeals::Dealership.clear()
      expect(WheelsAndDeals::Dealership.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_dealership = WheelsAndDeals::Dealership.new("Bob's Used Cars")
      test_dealership.save()
      test_dealership2 = WheelsAndDeals::Dealership.new("Jane's Cars")
      test_dealership2.save()
      expect(WheelsAndDeals::Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end
  describe('#add_vehicle') do
    it("adds a new vehicle to the dealership") do
      test_dealership = WheelsAndDeals::Dealership.new("Bob's Used Cars")
      test_vehicle = WheelsAndDeals::Vehicle.new({:thing=> "Toyota", :model => "Prius", \
        :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end
