class PlayerStatus < DataClass
    
    def initialize(player)
        @player = player
        activate
    end

    def activate
        @elimination_method = nil
        @elimination_phase = nil
        @elimination_order = nil
    end

    def active?
        @elimination_method == nil
    end

    def eliminate(method, phase)
        @elimination_method = method
        @elimination_phase = phase
        @elimination_order = @player.game.eliminated_players.count
    end

    def to_s
        active? ? @player.game.terminology.active : "#{@elimination_method} #{@elimination_phase}"
    end

end