cop = Resolver.new('Cop', 'target', 'inspect', 'investigated')
def cop.resolve(action)
    action.result = action.target.alignment.name
end

def cop.make_innocent(action)
    action.result = 'Town'
end