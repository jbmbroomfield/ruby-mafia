class Player < DataClass

    attr_accessor :game, :user, :role, :team, :status, :role_action

    def initialize(game, user, role)
        @game = game
        @user = user
        @role = role
        @team = game.get_team(role.alignment)
        @team.players << self
        @status = PlayerStatus.new(self)
    end

    def alignment
        role.alignment
    end

    def occupation
        role.occupation
    end

    def resolver
        occupation && occupation.resolver
    end

    def active?
        status.active?
    end

    def vote
        game.phase.votes.find { |vote| vote.player == self }
    end

    def vote_for(target)
        day = game.phase
        day.vote_for(self, target)
    end

    def votes_for
        day = game.phase
        day.votes_for(self)
    end

    def to_s
        user.to_s
    end

    def scum?
        role.scum?
    end

    def scum_target(target)
        return if !scum? || !target.active? || target.team == team
        team.action.player = self
        team.action.target = target
    end
    
    def role_target(target)
        if role.occupation && role.occupation.resolver && role.occupation.resolver.type == 'target'
            actions[0].target = target
        end
    end

    def actions
        game.phase.actions.filter { |action| action.player == self }
    end

    def last_result
        action = game.nights[-1].actions.find do |action2|
            action2.player == self
        end
        action && action.result
    end

end