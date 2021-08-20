standard = Setup.find_by(name: 'Standard')
game = standard.test_game
alice, bob, chris, derrick, esther, frank, gary = game.players

describe 'Basic Mechanics (2)' do

    it 'Mafia Victory' do
        expect(game.phase.to_s).to eq('Night 0')

        game.new_phase
        expect(game.phase.to_s).to eq('Day 1')

        alice.vote_for(esther)
        bob.vote_for(esther)
        chris.vote_for(esther)
        derrick.vote_for(esther)
        expect(alice.team.active_players.count).to eq(4)
        expect(frank.team.active_players.count).to eq(2)
        expect(game.phase.to_s).to eq('Night 1')
        game.new_phase
        expect(game.phase.to_s).to eq('Day 2')
        expect(game.phase.votes_required).to eq(4)
        
        alice.vote_for(derrick)
        bob.vote_for(derrick)
        chris.vote_for(derrick)
        frank.vote_for(derrick)
        expect(game.phase.to_s).to eq('Postgame')
        expect(game.winner.to_s).to eq('Mafia')
    end

end