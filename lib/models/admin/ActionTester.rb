class ActionTester < DataClass

    def initialize(*roles)
        @setup = Setup.new('Test Setup')
        @setup.test = true
        @setup.add_roles(*roles)
        set_up_game
    end

    def set_up_game
        @game = @setup.test_game
        tester = self
        extra_methods
        @game.new_phase
        @game.new_phase
    end

    def extra_methods
        @game.players.each do |player|
            extra_player_methods(player)
        end
    end

    def extra_player_methods(player)
        def player.result
            @game.new_phase
            return_value = last_result
            reset_game
            return_value
        end

        def player.reset_game
            @game.players.each do |player|
                player.status.activate
            end
            @game.new_phase
        end

        def player.survive?
            @game.new_phase
            return_value = @status.active?
            reset_game
            return_value
        end
    end

    def players
        @game.players
    end

    def actions
        @game.phase.actions
    end

    def result(player)
        @game.new_phase
        return_value = player.last_result
        reset
        return_value
    end

    def reset
        @game.new_phase
        @game.players.each do |player|
            player.status.activate
        end
    end

end