class Terminology

    attr_accessor :active, :eliminated, :exiled, :killed, :day, :night

    def initialize
        self.active = 'Active'
        self.eliminated = 'Eliminated'
        self.exiled = 'Exiled'
        self.killed = 'Killed'
        self.day = 'Day'
        self.night = 'Night'
    end

end