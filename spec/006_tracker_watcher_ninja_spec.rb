setup = Setup.new('Tracker, Watcher & Ninja')

setup.add_roles(
    'Town Tracker',
    'Town Watcher',
    'Town',
    'Town',
    'Town',
    'Town',
    'Town',
    'Mafia Ninja',
    'Mafia Rolecop',
)

game = setup.test_game
tracker, watcher, vt1, vt2, vt3, vt4, vt5, ninja, rolecop = game.players

game.new_phase
game.new_phase
tracker.role_target(vt1)
watcher.role_target(vt2)
game.new_phase

describe 'Tracker/Watcher/Ninja' do

    it 'Tracker - none' do
        expect(game.phase.to_s).to eq('Day 2')
        expect(tracker.last_result).to eq([])
    end
     
    it 'Watcher - none' do
        expect(watcher.last_result).to eq([])
    end

    it 'Tracker - 2 actions by same player' do
        game.new_phase
        tracker.role_target(rolecop)
        watcher.role_target(vt3)
        rolecop.scum_target(vt3)
        rolecop.role_target(vt3)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 3')
        expect(tracker.last_result).to eq([vt3.to_s])
    end

    it 'Watcher - 2 actions by same player' do
        expect(watcher.last_result).to eq([rolecop.to_s])
    end

    it 'Tracker on Ninja' do
        game.new_phase
        tracker.role_target(ninja)
        watcher.role_target(vt2)
        ninja.scum_target(vt2)
        rolecop.role_target(vt2)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 4')
        expect(tracker.last_result).to eq([])
    end

    it 'Watcher - Ninja and other' do
        expect(watcher.last_result).to eq([rolecop.to_s])
    end

    it 'Tracker - 2 results' do
        game.new_phase
        tracker.role_target(rolecop)
        rolecop.scum_target(vt4)
        rolecop.role_target(tracker)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 5')
        expect(tracker.last_result).to eq([tracker.to_s, vt4.to_s])
    end

    it 'Watcher - 2 results' do
        game.new_phase
        tracker.role_target(ninja)
        rolecop.role_target(ninja)
        watcher.role_target(ninja)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 6')
        expect(watcher.last_result).to eq([tracker.to_s, rolecop.to_s])
    end

end