require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('wheels_and_deals')
require('pry')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
   erb(:dealerships_form)
end

get('/dealerships') do
  @dealerships = WheelsAndDeals::Dealership.all()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  WheelsAndDeals::Dealership.new(name).save()
  @dealerships = WheelsAndDeals::Dealership.all()
  erb(:dealerships)
end

get('/vehicles/:id') do
  @vehicle = WheelsAndDeals::Vehicle.find(params.fetch('id').to_i())
  erb(:vehicle)
end

get('/dealerships/:id') do
  @dealership = WheelsAndDeals::Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealerships/:id/vehicles/new') do
    @dealership = WheelsAndDeals::Dealership.find(params.fetch('id').to_i())
    erb(:dealership_vehicles_form)
end

post('/vehicles') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  hash = {:make => make, :model => model, :year => year}
  @vehicle = WheelsAndDeals::Vehicle.new(hash)
  @vehicle.save()
  @dealership = WheelsAndDeals::Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:dealership)
end
