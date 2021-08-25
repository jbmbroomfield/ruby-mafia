tester = ActionTester.new(
    'Town Vanilla Cop',
    'Town',
    'Town Cop',
    'Mafia Godfather',
)

vanilla_cop, vt, cop, godfather = tester.players

describe 'Vanilla Cop' do

    it 'Vanilla result' do
        vanilla_cop.role_target(vt)
        expect(vanilla_cop.result).to eq('Vanilla')
    end

    it 'Non-vanilla result' do
        vanilla_cop.role_target(cop)
        expect(vanilla_cop.result).to eq('Not Vanilla')
    end

    it 'Vanilla result on Godfather' do
        vanilla_cop.role_target(godfather)
        expect(vanilla_cop.result).to eq('Vanilla')
    end

end