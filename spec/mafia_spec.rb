require_relative '../config/environment.rb'


standard = Setup.find_by(name: 'Standard')

game = standard.test_game

alice, bob, chris, derrick, esther, frank, gary = game.players

describe "Basic Mechanics" do
    
    it "Active Players" do
        expect(game.active_players.count).to eq(game.players.count)
    end

    it 'Night 0' do
        expect(game.phase.to_s).to eq('Night 0')
    end

    it 'Day 1 Start' do
        game.new_phase
        expect(game.phase.to_s).to eq('Day 1')
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
        chris.vote_for(gary)
        expect(gary.votes_for.count).to eq(3)
        expect(gary.active?).to eq(true)
        derrick.vote_for(gary)
        expect(gary.active?).to eq(false)
        expect(gary.status.to_s).to eq('Exiled Day 1')
        expect(game.active_players.count).to eq(6)
        expect(game.phase.to_s).to eq('Night 1')
    end

end