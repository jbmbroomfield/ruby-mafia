kill = Resolver.new('Kill', 'target', 'kill')
def kill.resolve(action)
    phase = action.night
    method = phase.game.terminology.killed
    action.target.status.eliminate(method, phase)
end