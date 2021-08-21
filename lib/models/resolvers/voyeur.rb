voyeur = Resolver.new('Voyeur', 'target', 'inspect', 'viewed')
def voyeur.resolve(action)
    action.result = []
    action.night.visible_actions.each do |action2|
        if action2.target == action.target && action2.player != action.player
            action.result << action2.resolver.verb
        end
    end
    action.result.sort!
end