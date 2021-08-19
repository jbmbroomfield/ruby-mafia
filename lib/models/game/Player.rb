class Player < DataClass

    attr_accessor :game, :user, :role, :status

    def initialize(game, user, role)
        self.game = game
        self.user = user
        self.role = role
        self.status = PlayerStatus.new(self)
    end

    def active?
        self.status.active?
    end

    def vote
        self.game.phase.votes.find { |vote| vote.player == self }
    end

    def vote_for(target)
        day = self.game.phase
        day.vote_for(self, target)
    end

    def votes_for
        day = self.game.phase
        day.votes_for(self)
    end

    def to_s
        "#{self.user} - #{self.role}"
    end

end