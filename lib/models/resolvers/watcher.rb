watcher = Resolver.new('Watcher', 'target', 'inspect')
def watcher.resolve(action)
    action.result = []
    action.night.visible_actions.each do |action2|
        if action2.target == action.target && action2.player != action.player
            action.result << action2.player 
        end
    end
    order_result(action)
end