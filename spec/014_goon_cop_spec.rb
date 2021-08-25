tester = ActionTester.new(
    'Town Goon Cop',
    'Town Cop',
    'Town',
    'Mafia',
    'Mafia Godfather',
    'Mafia Rolecop'
)

goon_cop, cop, vt, goon, godfather, rolecop = tester.players

describe 'Goon Cop' do

    it 'should return a negative result from a Town power role' do
        goon_cop.role_target(cop)
        expect(goon_cop.result).to eq('Not a Mafia Goon')
    end

    it 'should return a negative result from a Vanilla Townie' do
        goon_cop.role_target(vt)
        expect(goon_cop.result).to eq('Not a Mafia Goon')
    end

    it 'should return a positive result from a Mafia Goon' do
        goon_cop.role_target(goon)
        expect(goon_cop.result).to eq('Mafia Goon')
    end

    it 'should return a negative result from a Godfather' do
        goon_cop.role_target(godfather)
        expect(goon_cop.result).to eq('Not a Mafia Goon')
    end

    it 'should return a negative result from a Mafia Power Role' do
        goon_cop.role_target(rolecop)
        expect(goon_cop.result).to eq('Not a Mafia Goon')
    end

end