class Postgame < DataClass

    attr_accessor :game, :winner
    
    def initialize(game, winner)
        self.game = game
        self.winner = winner
    end

    def to_s
        'Postgame'
    end

end