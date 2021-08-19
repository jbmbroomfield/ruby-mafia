class NightAction < DataClass

    attr_accessor :night, :player, :target

    def initialize(night, player)
        self.night = night
        self.player = player
    end

end