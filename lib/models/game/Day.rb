class Day < DataClass

    attr_accessor :game, :number, :votes

    def initialize(game)
        game.days << self
        self.game = game
        self.number = game.days.count
        self.votes = game.active_players.map { |player| Vote.new(self, player)}
    end

    def ==(other)
        other.to_s == to_s
    end

    def to_s
        "#{game.terminology.day} #{number}"
    end

    def vote_for(player, target)
        vote = votes.find { |vote| vote.player == player }
        vote.target = target
        exile(target) if votes_for(target).count >= votes_required
    end

    def votes_for(target)
        votes.filter { |vote| vote.target == target }
    end

    def votes_required
        votes.count / 2 + 1
    end

    def exile(player)
        status = player.status
        status.eliminate(game.terminology.exiled, self)
        game.new_phase
    end

end