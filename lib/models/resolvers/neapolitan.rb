neapolitan = Resolver.new('Neapolitan', 'target', 'inspect')
def neapolitan.resolve(action)
    target = action.target
    if target.alignment.alignment_type.name == 'Town' and target.occupation == nil
        action.result = 'Vanilla Townie'
    else
        action.result = 'Not a Vanilla Townie'
    end
end

def neapolitan.make_innocent(action)
    action.result = 'Vanilla Townie'
end