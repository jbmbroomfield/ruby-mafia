class Day < DataClass

    attr_accessor :game, :number, :votes

    def initialize(game)
        self.game = game
        self.number = game.days.count + 1
        self.votes = game.active_players.map { |player| Vote.new(self, player)}
    end

    def ==(other)
        other.to_s == self.to_s
    end

    def to_s
        "#{self.game.terminology.day} #{self.number}"
    end

    def vote_for(player, target)
        vote = self.votes.find { |vote| vote.player == player }
        vote.target = target
        self.exile(target) if self.votes_for(target).count >= self.votes_required
    end

    def votes_for(target)
        self.votes.filter { |vote| vote.target == target }
    end

    def votes_required
        self.votes.count / 2 + 1
    end

    def exile(player)
        game = self.game
        status = player.status
        status.eliminate(game.terminology.exiled, self)
        game.next_phase
    end

end