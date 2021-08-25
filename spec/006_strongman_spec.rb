tester = ActionTester.new(
    'Town Doctor',
    'Town',
    'Mafia Strongman',
)

doctor, vt, strongman = tester.players

describe 'Strongman' do

    it 'Ignores Doctor' do
        doctor.role_target(vt)
        strongman.scum_target(vt)
        expect(vt.survive?).to eq(false)
    end

end