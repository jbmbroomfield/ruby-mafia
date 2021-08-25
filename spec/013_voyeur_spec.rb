tester = ActionTester.new(
    'Town Voyeur',
    'Town Voyeur',
    'Mafia Watcher',
    'Mafia Ninja'
)

voyeur, voyeur2, mafia_voyeur, ninja = tester.players

describe 'Voyeur' do

    it 'No results' do
        voyeur.role_target(mafia_voyeur)
        expect(voyeur.result).to eq([])
    end

    it 'One result' do
        voyeur.role_target(mafia_voyeur)
        voyeur2.role_target(mafia_voyeur)
        expect(voyeur.result).to eq([voyeur.role.occupation.resolver.verb])
    end

    it 'No results on Ninja' do
        voyeur.role_target(voyeur2)
        ninja.scum_target(voyeur2)
        expect(voyeur.result).to eq([])
    end

    it 'Two results' do
        voyeur.role_target(ninja)
        voyeur2.role_target(ninja)
        mafia_voyeur.role_target(ninja)
        expect(voyeur.result).to eq([voyeur2.role.occupation.resolver.verb, mafia_voyeur.role.occupation.resolver.verb].sort)
    end

end