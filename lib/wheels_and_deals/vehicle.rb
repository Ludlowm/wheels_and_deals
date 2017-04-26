module WheelsAndDeals
  class Vehicle
     @@vehicles = []

    attr_reader :id

    def initialize(attributes)
      attributes.each_pair do |key, value|
        self.class.class_eval { attr_accessor key }
        send(key.to_s + '=', value)
      end
      @id = @@vehicles.length().+(1)
    end

    def all_vehicles
      @@vehicles
    end

    def save
      @@vehicles << self
    end

    def instance_variables_hash
      Hash[instance_variables.map { |name| [name, instance_variable_get(name)] } ]
    end

    def self.find_by(args)
      args = args.each_with_object({}){|(k,v), h| h[k.to_sym] = v}
      binding.pry
      @@vehicles.select { |e| e.instance_variables_hash.merge(args) == e.instance_variables_hash }
    end

    def self.find(id)
      find_by({:@id => id}).first
    end
  end
end
