tester = ActionTester.new(
    'Town Motion Detector',
    'Town Cop',
    'Mafia',
    'Mafia Ninja'
)

motion_detector, cop, goon, ninja = tester.players

describe 'Motion Detector' do

    it 'should receive a negative result when there is no motion' do
        motion_detector.role_target(goon)
        cop.role_target(ninja)
        expect(motion_detector.result).to eq('No motion detected')
    end

    it 'should receive a positive result when there is any motion' do
        ['cop', 'goon', 'both'].each do |x|
            cop.role_target(goon) if ['cop', 'both'].include?(x)
            goon.scum_target(cop) if ['goon', 'both'].include?(x)
            motion_detector.role_target(cop)
            expect(motion_detector.result).to eq('Motion detected')
        end
    end

    it 'should receive a negative result when the only motion is by a Ninja' do
        [true, false].each do |x|
            motion_detector.role_target(x ? cop : ninja)
            ninja.scum_target(cop)
            expect(motion_detector.result).to eq('No motion detected')
        end
    end

end