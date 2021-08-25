class Night < DataClass

    attr_accessor :game, :number, :actions, :name

    def initialize(game)
        game.nights << self
        self.game = game
        self.number = game.nights.count - (game.setup.daystart ? 0 : 1)
        self.actions = []
        if number > 0
            create_team_actions
            create_role_actions
        end
    end

    def create_team_actions
        game.active_scum_teams.each do |team|
            team.action = NightAction.new(self, 'Kill')
        end
    end

    def create_role_actions
        game.active_players.each do |player|
            NightAction.new(self, player.resolver, player) if player.resolver
        end
    end

    def successful_actions
        actions.filter { |action| action.successful }
    end

    def visible_actions
        actions.filter { |action| action.visible && action.target }
    end

    def to_s
        "#{game.terminology.night} #{number}"
    end

    def resolve_actions
        resolver = NightActionsResolver.new(actions)
        resolver.resolve
    end

end