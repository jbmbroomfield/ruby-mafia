class Game < DataClass

    attr_accessor :setup, :name, :players, :phase, :days, :nights, :terminology, :teams

    def initialize(setup, name, users)
        setup.games << self
        self.terminology = Terminology.new
        self.setup = setup
        self.players = []
        self.days = []
        self.nights = []
        self.teams = []
        self.assign_roles(users)
        self.new_phase
    end

    def active_players
        players.filter { |player| player.active? }
    end

    def eliminated_players
        players.filter { |player| !player.active? }
    end

    def assign_roles(users)
        users.zip(setup.roles).each do |user, role|
            new_player(user, role) if user && role
        end
    end

    def get_team(alignment)
        teams.find { |team| team.alignment == alignment } || Team.new(self, alignment)
    end

    def scum_teams
        teams.filter { |team| team.scum? }
    end

    def active_scum_teams
        scum_teams.filter { |team| team.active? }
    end

    def new_player(*args)
        player = Player.new(self, *args)
        players << player
        player
    end

    def winner
        return phase.winner if phase.is_a?(Postgame)
        teams.find { |team| team.victory? }
    end

    def new_phase
        self.phase = phase ? next_phase : first_phase
    end

    private

    def next_phase
        if winner
            Postgame.new(self, winner)
        elsif phase.is_a?(Night)
            phase.resolve_actions
            new_day
        else
            setup.nightless ? new_day : new_night
        end
    end

    def first_phase
        setup.daystart ? new_day : new_night
    end

    def new_day
        Day.new(self)
    end

    def new_night
        Night.new(self)
    end

end