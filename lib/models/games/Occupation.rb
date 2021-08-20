class Occupation < DataClass

    attr_accessor :name, :resolver, :role_string

    def initialize(name, resolver_name = nil)
        @name = name
        @resolver = Resolver.find_by(name: resolver_name || name)
    end

    def to_s
        name
    end
    
end


Occupation.new_many(
    'Innocent Child',
    'Cop',
    'Godfather',
    'Doctor',
    ['Vigilante', 'Kill'],
    'Strongman',
)