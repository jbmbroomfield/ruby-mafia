standard = Setup.find_by(name: 'Standard')
game = standard.test_game
alice, bob, chris, derrick, esther, frank, gary = game.players
town = alice.team
# mafia = frank.team

describe 'Night Kill' do
    it 'Night Kill' do
        expect(alice.team.to_s).to eq('Town')
        expect(bob.team.to_s).to eq('Town')
        expect(chris.team.to_s).to eq('Town')
        expect(derrick.team.to_s).to eq('Town')
        expect(esther.team.to_s).to eq('Town')
        expect(frank.team.to_s).to eq('Mafia')
        expect(gary.team.to_s).to eq('Mafia')
        game.new_phase
        game.new_phase
        expect(game.phase.to_s).to eq('Night 1')
        
        frank.scum_target(alice)
        game.new_phase
        kill = game.nights[-1].actions[0]
        expect(kill.result).to eq('Frank attacked Alice')
        expect(game.phase.to_s).to eq('Day 2')
        expect(alice.active?).to eq(false)
        expect(alice.status.to_s).to eq('Killed Night 1')
        expect(town.active_players.count).to eq(4)
        expect(game.active_players.count).to eq(6)
        expect(game.phase.votes.count).to eq(6)
    end

    it 'Only one Night Kill' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 2')

        frank.scum_target(bob)
        gary.scum_target(chris)
        game.new_phase
        kill = game.nights[-1].actions[0]
        expect(kill.result).to eq('Gary attacked Chris')
        expect(bob.active?).to eq(true)
        expect(chris.active?).to eq(false)
        expect(town.active_players.count).to eq(3)
        expect(game.active_players.count).to eq(5)
        expect(game.phase.votes.count).to eq(5)
    end
end
