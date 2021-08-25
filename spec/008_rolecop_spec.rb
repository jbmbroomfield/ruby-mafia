tester = ActionTester.new(
    'Town Rolecop',
    'Town Cop',
    'Town',
    'Mafia Godfather',
)

rolecop, cop, vt, godfather = tester.players

describe 'Rolecop' do

    it 'Role result' do
        rolecop.role_target(cop)
        expect(rolecop.result).to eq('Cop')
    end

    it 'Vanilla result' do
        rolecop.role_target(vt)
        expect(rolecop.result).to eq('Vanilla')
    end

    it 'Vanilla result on Godfather' do
        rolecop.role_target(godfather)
        expect(rolecop.result).to eq('Vanilla')
    end

end