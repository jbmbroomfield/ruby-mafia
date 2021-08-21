follower = Resolver.new('Follower', 'target', 'inspect', 'followed')
def follower.resolve(action)
    action.result = []
    action.night.visible_actions.each do |action2|
        if action2.player == action.target && action2.target
            action.result << action2.resolver.verb
        end
    end
    action.result.sort!
end