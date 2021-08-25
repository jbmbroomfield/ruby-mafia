tester = ActionTester.new(
    'Town Watcher',
    'Town Watcher',
    'Mafia Watcher',
    'Mafia Ninja'
)

watcher, watcher2, mafia_watcher, ninja = tester.players

describe 'Watcher' do

    it 'No results' do
        watcher.role_target(mafia_watcher)
        expect(watcher.result).to eq([])
    end

    it 'One result' do
        watcher.role_target(mafia_watcher)
        watcher2.role_target(mafia_watcher)
        expect(watcher.result).to eq([watcher2.to_s])
    end

    it 'No results on Ninja' do
        watcher.role_target(watcher2)
        ninja.scum_target(watcher2)
        expect(watcher.result).to eq([])
    end

    it 'Two results' do
        watcher.role_target(ninja)
        watcher2.role_target(ninja)
        mafia_watcher.role_target(ninja)
        expect(watcher.result).to eq([watcher2.to_s, mafia_watcher.to_s])
    end

end