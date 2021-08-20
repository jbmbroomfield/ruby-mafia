standard = Setup.find_by(name: 'Standard')
game = standard.test_game
cop, doctor, chris, derrick, esther, godfather, goon = game.players
# town = cop.team
# mafia = godfather.team

game.new_phase
game.new_phase

describe 'Basic Roles' do
    it 'Cop on Town' do
        expect(chris.team.to_s).to eq('Town')
        expect(derrick.team.to_s).to eq('Town')
        expect(esther.team.to_s).to eq('Town')
        expect(game.phase.to_s).to eq('Night 1')
        
        cop.role_target(doctor)
        doctor.role_target(chris)
        godfather.scum_target(chris)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 2')

        night1 = game.nights[-1]
        cop_action = night1.actions.find { |action| action.name == 'Cop' }
        expect(cop_action.result).to eq('Town')
    end

    it 'Successful Doctor' do
        expect(chris.active?).to eq(true)
        expect(game.active_players.count).to eq(7)
    end

    it 'Cop on Mafia' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 2')

        cop.role_target(goon)
        godfather.scum_target(chris)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 3')

        night2 = game.nights[-1]
        cop_action = night2.actions.find { |action| action.name == 'Cop' }
        expect(cop_action.result).to eq('Mafia')
    end

    it 'Cop on Godfather' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 3')

        cop.role_target(godfather)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 4')

        night3 = game.nights[-1]
        cop_action = night3.actions.find { |action| action.name == 'Cop' }
        expect(cop_action.result).to eq('Town')
    end

end