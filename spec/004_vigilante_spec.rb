tester = ActionTester.new(
    'Town Vigilante',
    'Town Doctor',
    'Mafia'
)

vig, doctor, goon = tester.players

describe 'Vigilante' do

    it 'Successful Kill' do
        vig.role_target(goon)
        expect(goon.survive?).to eq(false)
    end

    it 'Blocked by Doctor' do
        vig.role_target(goon)
        doctor.role_target(goon)
        expect(goon.survive?).to eq(true)
    end

end