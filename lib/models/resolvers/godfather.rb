godfather = Resolver.new('Godfather', 'passive', 'post')
def godfather.resolve(action)
    action.night.successful_actions.each do |action2|
        action2.make_innocent if action2.target == action.player
    end
end