doctor = Resolver.new('Doctor', 'target', 'protect')
def doctor.resolve(action)
    kill = action.night.successful_actions.find do |action2|
        action2.resolver.is_a?(Kill) && action2.target == action.target
    end
    kill.successful = false if kill
end