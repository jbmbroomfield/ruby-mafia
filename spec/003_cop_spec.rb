tester = ActionTester.new(
    'Town Cop',
    'Town',
    'Mafia',
    'Mafia Godfather',
)

cop, vt, goon, godfather = tester.players

describe 'Cop' do
    
    it 'Target Townie' do
        cop.role_target(vt)
        expect(cop.result).to eq('Town')
    end

    it 'Target Mafia' do
        cop.role_target(goon)
        expect(cop.result).to eq('Mafia')
    end

    it 'Target Godfather' do
        cop.role_target(godfather)
        expect(cop.result).to eq('Town')
    end

end