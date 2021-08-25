watcher = Resolver.new('Watcher', 'target', 'inspect', 'watched')

def watcher.resolve(action)
    action.result = []
    action.night.visible_actions.each do |action2|
        push_to_result_if_appropriate(action2, action)
    end
    order_result(action)
end

def watcher.push_to_result_if_appropriate(action2, action)
    if action2.target == action.target && action2.player != action.player
        action.result << action2.player 
    end
end