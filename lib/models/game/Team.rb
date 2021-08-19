class Team < DataClass

    attr_accessor :game, :alignment, :name, :players
    
    def initialize(game, alignment, name = nil)
        self.game = game
        self.alignment = alignment
        self.name = name || alignment.name
        self.players = []
    end

    def to_s
        self.name
    end

end