class Game < DataClass

    attr_accessor :setup, :name, :players, :phase, :days, :nights, :terminology

    def initialize(setup, name, users)
        setup.games << self
        self.setup = setup
        self.players = []
        self.assign_roles(users)
        self.days = []
        self.nights = []
        self.new_phase
        self.terminology = Terminology.new
    end

    def new_player(*args)
        player = Player.new(self, *args)
        self.players << player
        player
    end

    def new_phase
        self.phase ? self.next_phase : self.first_phase
    end

    def next_phase
        if self.phase.is_a?(Day)
            self.setup.nightless ? self.new_day : self.new_night
        else
            self.new_day
        end
    end

    def first_phase
        self.setup.daystart ? self.new_day : self.new_night
    end

    def new_day
        self.phase = Day.new(self)
        self.days << self.phase
        self.phase
    end

    def new_night
        self.phase = Night.new(self)
        self.nights << self.phase
        self.phase
    end

    def active_players
        self.players.filter { |player| player.active? }
    end

    def eliminated_players
        self.players.filter { |player| !player.active? }
    end

    def assign_roles(users)
        users.zip(self.setup.roles) do |user, role|
            self.new_player(user, role) if user && role
        end
    end

end