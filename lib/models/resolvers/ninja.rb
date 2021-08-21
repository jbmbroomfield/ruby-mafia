ninja = Resolver.new('Ninja', 'passive', 'pre')
def ninja.resolve(action)
    action.night.actions.each do |action2|
        action2.visible = false if action2.player == action.player
    end
end