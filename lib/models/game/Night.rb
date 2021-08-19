class Night < DataClass

    attr_accessor :game, :number, :actions, :name

    def initialize(game)
        self.game = game
        self.number = game.nights.count + (game.setup.daystart ? 1 : 0)
        self.actions = []
    end

    def ==(other)
        other.to_s == self.to_s
    end

    def to_s
        "#{self.game.terminology.night} #{self.number}"
    end

    def resolve_actions
    end

end