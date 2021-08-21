tracker = Resolver.new('Tracker', 'target', 'inspect', 'investigated')
def tracker.resolve(action)
    action.result = []
    action.night.visible_actions.each do |action2|
        if action2.player == action.target && action2.target
            action.result << action2.target
        end
    end
    order_result(action)
end