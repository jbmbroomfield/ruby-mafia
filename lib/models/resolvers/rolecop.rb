rolecop = Resolver.new('Rolecop', 'target', 'inspect', 'investigated')
def rolecop.resolve(action)
    target = action.target
    action.result = target.occupation ? target.occupation.name : 'Vanilla'
end

def rolecop.make_innocent(action)
    action.result = 'Vanilla'
end