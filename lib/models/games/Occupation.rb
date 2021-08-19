class Occupation < DataClass

    attr_accessor :name, :role_string

    def initialize(name)
        self.name = name
    end

    def to_s
        self.name
    end
    
end

ic = Occupation.new('Innocent Child')
ic.role_string = 'Innocent Child'

Occupation.new('Cop')
Occupation.new('Doctor')