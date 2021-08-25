goon_cop = Resolver.new('Goon Cop', 'target', 'inspect', 'investigated')

def goon_cop.resolve(action)
    action.result = action.target.role.to_s == 'Mafia Goon' ? 'Mafia Goon' : 'Not a Mafia Goon'
end