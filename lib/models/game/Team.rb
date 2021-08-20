class Team < DataClass

    attr_accessor :game, :alignment, :name, :players, :action
    
    def initialize(game, alignment, name = nil)
        game.teams << self
        self.game = game
        self.alignment = alignment
        self.name = name || alignment.name
        self.players = []
    end

    def to_s
        name
    end

    def scum?
        alignment.scum?
    end

    def active_players
        players.filter { |player| player.active? }
    end
    
    def active?
        active_players.count > 0
    end

    def victory?
        alignment.alignment_type.victory?(self)
    end

    def set_target(player, target)
        self.action ||= NightAction.new(game.phase)
        action.player = player
        action.target = target
    end

end