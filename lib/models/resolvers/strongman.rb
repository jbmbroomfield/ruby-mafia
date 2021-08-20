strongman = Resolver.new('Strongman', 'passive', 'misc')
def strongman.resolve(action)
    kills = action.night.actions.filter do |action2|
        action2.name == 'Kill' && action2.player == action.player
    end
    kills.each do |kill|
        kill.successful = true
    end 
end