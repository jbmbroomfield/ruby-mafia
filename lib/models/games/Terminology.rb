class Terminology

    attr_accessor :active, :eliminated, :exiled, :day, :night

    def initialize
        self.active = 'Active'
        self.eliminated = 'Eliminated'
        self.exiled = 'Exiled'
        self.day = 'Day'
        self.night = 'Night'
    end

end