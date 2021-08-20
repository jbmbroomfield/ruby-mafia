vanilla_cop = Resolver.new('Vanilla Cop', 'target', 'inspect')
def vanilla_cop.resolve(action)
    action.result = action.target.occupation ? 'Not Vanilla' : 'Vanilla'
end

def vanilla_cop.make_innocent(action)
    action.result = 'Vanilla'
end