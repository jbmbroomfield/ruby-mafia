class Night < DataClass

    attr_accessor :game, :number, :actions, :name

    def initialize(game)
        game.nights << self
        self.game = game
        self.number = game.nights.count - (game.setup.daystart ? 0 : 1)
        self.actions = []
        game.active_scum_teams.each do |team|
            team.action = NightAction.new(self, 'kill')
        end
        if number > 0
            create_role_actions
        end
    end

    def create_role_actions
        players_with_night_actions.each do |player|
            player.role_action = NightAction.new(self, player.role.occupation, player)
        end
    end

    def players_with_night_actions
        game.active_players.filter do |player|
            player.role.occupation && player.role.occupation.night_action
        end
    end

    def ==(other)
        other.to_s == to_s
    end

    def to_s
        "#{game.terminology.night} #{number}"
    end

    def resolve_actions
        resolver = NightActionResolver.new(actions)
        resolver.resolve
    end

end