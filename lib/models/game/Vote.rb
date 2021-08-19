class Vote < DataClass

    attr_accessor :day, :player, :target

    def initialize(day, player)
        self.day = day
        self.player = player
    end

    def vote_for(target)
        self.target = target
    end

end