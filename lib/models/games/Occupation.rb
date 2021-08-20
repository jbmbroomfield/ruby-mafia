class Occupation < DataClass

    attr_accessor :name, :resolver, :role_string

    def initialize(name)
        @name = name
        @resolver = Resolver.find_by(name: name)
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
)