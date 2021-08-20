standard = Setup.find_by(name: 'Standard')
game = standard.test_game
alice, bob, chris, derrick, esther, frank, gary = game.players

describe 'Basic Mechanics (1)' do
    
    it 'Teams' do
        expect(alice.team.to_s).to eq('Town')
        expect(frank.team.to_s).to eq('Mafia')
        expect(alice.team.players.count).to eq(5)
        expect(alice.team.active_players.count).to eq(5)
        expect(frank.team.players.count).to eq(2)
        expect(frank.team.active_players.count).to eq(2)
    end

    it "Active Players" do
        expect(game.active_players.count).to eq(game.players.count)
    end

    it 'Night 0' do
        expect(game.phase.to_s).to eq('Night 0')
        expect(game.nights.count).to eq(1)
        expect(game.days.count).to eq(0)
    end

    it 'Day 1 Start' do
        game.new_phase
        expect(game.phase.to_s).to eq('Day 1')
        expect(game.nights.count).to eq(1)
        expect(game.days.count).to eq(1)
        expect(game.phase.votes.count).to eq(game.players.count)
    end

    it 'Voting' do
        alice.vote_for(frank)
        expect(alice.vote.target).to eq(frank)

        alice.vote_for(gary)
        expect(alice.vote.target).to eq(gary)

        bob.vote_for(gary)
        expect(gary.votes_for.count).to eq(2)
    end

    it 'Exiling' do
        expect(game.phase.votes_required).to eq(4)

        chris.vote_for(gary)
        expect(gary.votes_for.count).to eq(3)
        expect(gary.active?).to eq(true)

        derrick.vote_for(gary)
        expect(gary.active?).to eq(false)
        expect(gary.status.to_s).to eq('Exiled Day 1')
        expect(gary.team.players.count).to eq(2)
        expect(gary.team.active_players.count).to eq(1)
        expect(game.active_players.count).to eq(6)
        expect(game.nights.count).to eq(2)
        expect(game.days.count).to eq(1)
        expect(game.phase.to_s).to eq('Night 1')
    end

    it 'Day 2' do
        game.new_phase
        expect(game.phase.to_s).to eq('Day 2')
        expect(game.days.count).to eq(2)
        expect(game.nights.count).to eq(2)
        expect(game.phase.votes_required).to eq(4)
    end

    it 'Town Victory' do
        alice.vote_for(frank)
        bob.vote_for(frank)
        chris.vote_for(frank)
        expect(game.phase.to_s).to eq('Day 2')

        derrick.vote_for(frank)
        expect(game.phase.to_s).to eq('Postgame')
        expect(game.winner.to_s).to eq('Town')
    end

end