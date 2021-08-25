tester = ActionTester.new(
    'Town Follower',
    'Town Cop',
    'Mafia Watcher',
    'Mafia Ninja'
)

follower, cop, watcher, ninja = tester.players

describe 'Follower' do

    it 'No results' do
        follower.role_target(watcher)
        expect(follower.result).to eq([])
    end

    it 'One result' do
        follower.role_target(cop)
        cop.role_target(follower)
        expect(follower.result).to eq([cop.role.occupation.resolver.verb])
    end

    it 'No results on Ninja' do
        follower.role_target(ninja)
        ninja.scum_target(cop)
        expect(follower.result).to eq([])
    end

    it 'Two results' do
        follower.role_target(watcher)
        watcher.role_target(cop)
        watcher.scum_target(follower)
        expect(follower.result).to eq(['attacked', watcher.role.occupation.resolver.verb].sort)
    end

end