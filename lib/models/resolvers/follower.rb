follower = Resolver.new('Follower', 'target', 'inspect', 'followed')
def follower.resolve(action)
    action.result = []
    action.night.visible_actions.each do |action2|
        push_if_appropriate(action2, action)
    end
    action.result.sort!
end

def follower.push_if_appropriate(action2, action)
    if action2.player == action.target && action2.target
        action.result << action2.resolver.verb
    end
end