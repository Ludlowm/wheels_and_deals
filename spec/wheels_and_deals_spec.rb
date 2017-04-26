require 'spec_helper'

RSpec.describe WheelsAndDeals do
  before(:each) do
    @car = WheelsAndDeals::Vehicle.new({:thing=> "Toyota", :model => "Prius", \
      :year => "2000", :color => "blue", :engine_size => "4L", :number_of_doors => "4"})
  end

  it 'has a version number' do
    expect(WheelsAndDeals::VERSION).not_to be nil
  end

  describe("#color") do
    it("returns the model of the vehicle") do
      expect(@car.color()).to(eq("blue"))
    end
  end

  describe("#engine_size") do
    it("returns the model of the vehicle") do
      expect(@car.engine_size()).to(eq("4L"))
    end
  end

  describe("#number_of_doors") do
    it("returns the model of the vehicle") do
      expect(@car.number_of_doors()).to(eq("4"))
    end
  end
end
