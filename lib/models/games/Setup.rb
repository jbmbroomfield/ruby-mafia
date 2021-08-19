class Setup < DataClass

    attr_accessor :name, :roles, :games, :daystart, :nightless

    def initialize(name)
        self.name = name
        self.roles = []
        self.games = []
        self.daystart = false
        self.nightless = false
    end

    def add_role(*args)
        Role.new(self, *args)
    end

    def add_roles(*roles)
        roles.each do |role|
            role_split = role.split(' ')
            # alignment = role_split.shift
            # occupation = role_split.join(' ')
            self.add_role(role_split.shift, role_split.join(' '))
        end
    end

    def to_s
        self.name
    end

    def new_game(name, users)
        Game.new(self, name, users)
    end

    def test_game
        Game.new(self, "Test Game", User.all)
    end

end