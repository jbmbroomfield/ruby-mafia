tester = ActionTester.new(
    'Town Tracker',
    'Town Tracker',
    'Mafia Tracker',
    'Mafia Ninja'
)

tracker, tracker2, mafia_tracker, ninja = tester.players

describe 'Tracker' do

    it 'No results' do
        tracker.role_target(mafia_tracker)
        expect(tracker.result).to eq([])
    end

    it 'One result' do
        tracker.role_target(tracker2)
        tracker2.role_target(tracker)
        expect(tracker.result).to eq([tracker.to_s])
    end

    it 'No results on Ninja' do
        tracker.role_target(ninja)
        ninja.scum_target(tracker2)
        expect(tracker.result).to eq([])
    end

    it 'Two results' do
        tracker.role_target(mafia_tracker)
        mafia_tracker.role_target(tracker2)
        mafia_tracker.scum_target(tracker)
        expect(tracker.result).to eq([tracker.to_s, tracker2.to_s])
    end

end