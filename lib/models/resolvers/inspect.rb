cop = Resolver.new('Cop', 'target', 'inspect')
def cop.resolve(action)
    action.result = action.target.alignment
end

puts 'hi'