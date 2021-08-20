class Player < DataClass

    attr_accessor :game, :user, :role, :team, :status, :role_action

    def initialize(game, user, role)
        self.game = game
        self.user = user
        self.role = role
        self.team = game.get_team(role.alignment)
        self.team.players << self
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
        self.user.to_s
    end

    def scum?
        self.role.scum?
    end

    def scum_target(target)
        return if !scum? || !target.active? || target.team == team
        team.action.player = self
        team.action.target = target
    end
    
    def role_target(target)
        return if !role.occupation || role.occupation.night_action != 'target'
        self.role_action.target = target
    end

end