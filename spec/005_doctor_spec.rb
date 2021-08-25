tester = ActionTester.new(
    'Town Doctor',
    'Town Vigilante',
    'Town',
    'Mafia',
)

doctor, vig, vt, goon = tester.players

describe 'Doctor' do
    
    it 'Successful Doctor' do
        [true, false].each do |bool|
            doctor.role_target(vt)
            bool ? vig.role_target(vt) : goon.scum_target(vt)
            expect(vt.survive?).to eq(true)
        end
    end

    it 'Only blocks one Kill' do
        doctor.role_target(vt)
        vig.role_target(vt)
        goon.scum_target(vt)
        expect(vt.survive?).to eq(false)
    end

end