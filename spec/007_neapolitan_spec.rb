tester = ActionTester.new(
    'Town Neapolitan',
    'Town Neapolitan',
    'Town',
    'Mafia Godfather',
    'Mafia Goon'
)

neapolitan, neapolitan2, vt, godfather, goon = tester.players

describe 'Neapolitan' do
    
    it 'Target a non-VT Town' do
        neapolitan.role_target(neapolitan2)
        expect(neapolitan.result).to eq('Not a Vanilla Townie')
    end

    it 'Target a VT' do
        neapolitan.role_target(vt)
        expect(neapolitan.result).to eq('Vanilla Townie')
    end

    it 'Target a Godfather' do
        neapolitan.role_target(godfather)
        expect(neapolitan.result).to eq('Vanilla Townie')
    end
    
    it 'Target a non-Godfather Mafia' do
        neapolitan.role_target(goon)
        expect(neapolitan.result).to eq('Not a Vanilla Townie')
    end

end
