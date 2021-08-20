godfather = Resolver.new('Godfather', 'passive', 'post')
def godfather.resolve(action)
    cop_actions = action.night.successful_actions.filter do |action2|
        action2.resolver.is_a?(Cop) && action2.target == action.player
    end
    cop_actions.each do |cop_action|
        cop_action.result = 'Town'
    end
end