setup = Setup.new('Vigilante & Strongman')

setup.add_roles(
    'Town Vigilante',
    'Town Doctor',
    'Town',
    'Town',
    'Town',
    'Town',
    'Mafia Strongman',
    'Mafia',
)

game = setup.test_game
players = game.players
vigilante = players[0]
doctor = players[1]
chris = players[2]
derrick = players[3]
strongman = players[6]
goon = players[7]

game.new_phase
game.new_phase

vigilante.role_target(chris)
doctor.role_target(derrick)
strongman.scum_target(derrick)
game.new_phase

describe 'Vigilante/Strongman' do

    it 'Vigilante Kill' do
        expect(game.phase.to_s).to eq('Day 2')
        expect(chris.active?).to eq(false)
        expect(chris.status.to_s).to eq('Killed Night 1')
    end

    it 'Strongman Kill' do
        expect(derrick.active?).to eq(false)
        expect(derrick.status.to_s).to eq('Killed Night 1')
        expect(game.active_players.count).to eq(6)
    end

    it 'Vig blocked by Doctor' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 2')

        vigilante.role_target(goon)
        doctor.role_target(goon)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 3')
        expect(goon.active?).to eq(true)
        expect(game.active_players.count).to eq(6)
    end

end