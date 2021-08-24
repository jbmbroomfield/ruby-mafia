setup = Setup.new('Follower & Voyeur')

setup.add_roles(
    'Town Follower',
    'Town Voyeur',
    'Town',
    'Town',
    'Town',
    'Town',
    'Town',
    'Mafia Ninja',
    'Mafia Rolecop',
)

game = setup.test_game
follower, voyeur, vt1, vt2, vt3, vt4, vt5, ninja, rolecop = game.players
vt5.to_s
game.new_phase
game.new_phase

follower.role_target(voyeur)
voyeur.role_target(vt1)
rolecop.role_target(vt1)
game.new_phase

describe "Follower/Voyeur" do

    it 'Follower gets one result' do
        expect(game.phase.to_s).to eq('Day 2')
        expect(follower.last_result).to eq(['viewed'])
    end

    it 'Voyeur gets one result' do
        expect(voyeur.last_result).to eq(['investigated'])
    end

    it 'Follower gets no results' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 2')
        follower.role_target(vt4)
        voyeur.role_target(vt4)
        rolecop.scum_target(vt4)
        rolecop.role_target(vt4)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 3')
        expect(follower.last_result).to eq([])
    end

    it 'Voyeur gets multiple results' do
        expect(voyeur.last_result).to eq(['attacked', 'followed', 'investigated'])
    end

    it 'Follower gets multiple results' do
        game.new_phase
        follower.role_target(rolecop)
        rolecop.role_target(vt2)
        rolecop.scum_target(vt3)
        voyeur.role_target(follower)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 4')
        expect(follower.last_result).to eq(['attacked', 'investigated'])
    end

    it 'Voyeur gets no results' do
        expect(voyeur.last_result). to eq([])
    end

    it "Follower can't see Ninja" do
        game.new_phase
        follower.role_target(ninja)
        ninja.scum_target(vt1)
        voyeur.role_target(vt1)
        rolecop.role_target(vt1)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 5')
        expect(follower.last_result).to eq([])
    end

    it "Voyeur can't see Ninja" do
        expect(voyeur.last_result).to eq(['investigated'])
    end

end