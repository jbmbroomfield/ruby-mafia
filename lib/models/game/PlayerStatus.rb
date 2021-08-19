class PlayerStatus < DataClass

    attr_accessor :player, :elimination_method, :elimination_phase, :elimination_order
    
    def initialize(player)
        self.player = player
    end

    def active?
        self.elimination_method == nil
    end

    def eliminate(method, phase)
        self.elimination_method = method
        self.elimination_phase = phase
        self.elimination_order = self.player.game.eliminated_players.count
    end

    def to_s
        self.active? ? self.game.terminology.active : "#{self.elimination_method} #{self.elimination_phase}"
    end

end