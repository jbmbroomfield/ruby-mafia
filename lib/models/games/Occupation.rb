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
    'Cop',
    'Doctor',
    'Godfather',
    'Innocent Child',
    'Neapolitan',
    'Ninja',
    'Rolecop',
    'Strongman',
    'Tracker',
    ['Vigilante', 'Kill'],
    'Vanilla Cop',
    'Watcher',
)