setup = Setup.new('Neapolitan, Rolecop & Vanilla Cop')

setup.add_roles(
    'Town Neapolitan',
    'Town Rolecop',
    'Town Vanilla Cop',
    'Town',
    'Town',
    'Mafia',
    'Mafia Godfather',
)

game = setup.test_game
neapolitan, rolecop, vanilla_cop, vt1, vt2, goon, godfather = game.players
game.new_phase
game.new_phase
neapolitan.role_target(rolecop)
rolecop.role_target(goon)
vanilla_cop.role_target(goon)
game.new_phase

describe 'Neapolitan/Rolecop/Vanilla Cop' do

    it 'Neapolitan on non-VT' do
        expect(game.phase.to_s).to eq('Day 2')
        expect(neapolitan.last_result).to eq('Not a Vanilla Townie')
    end

    it 'Rolecop on Goon' do
        expect(rolecop.last_result).to eq('Vanilla')
    end

    it 'Vanilla Cop on Goon' do
        expect(vanilla_cop.last_result).to eq('Vanilla')
    end

    it 'Neapolitan on Goon' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 2')

        neapolitan.role_target(goon)
        rolecop.role_target(neapolitan)
        vanilla_cop.role_target(rolecop)
        godfather.scum_target(vt2)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 3')
        expect(neapolitan.last_result).to eq('Not a Vanilla Townie')
    end

    it 'Rolecop on Neapolitan' do
        expect(rolecop.last_result).to eq('Neapolitan')
    end

    it 'Vanilla Cop on non-Vanilla' do
        expect(vanilla_cop.last_result).to eq('Not Vanilla')
    end

    it 'Neapolitan on VT' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 3')

        neapolitan.role_target(vt1)
        rolecop.role_target(vt1)
        vanilla_cop.role_target(vt1)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 4')
        expect(neapolitan.last_result).to eq('Vanilla Townie')
    end

    it 'Rolecop on VT' do
        expect(rolecop.last_result).to eq('Vanilla')
    end

    it 'Vanilla Cop on VT' do
        expect(vanilla_cop.last_result).to eq('Vanilla')
    end

    it 'Neapolitan on Godfather' do
        game.new_phase
        expect(game.phase.to_s).to eq('Night 4')

        neapolitan.role_target(godfather)
        rolecop.role_target(godfather)
        vanilla_cop.role_target(godfather)
        game.new_phase
        expect(game.phase.to_s).to eq('Day 5')
        expect(neapolitan.last_result).to eq('Vanilla Townie')
    end

    it 'Rolecop on Godfather' do
        expect(rolecop.last_result).to eq('Vanilla')
    end

    it 'Vanilla Cop on Godfather' do
        expect(vanilla_cop.last_result).to eq('Vanilla')
    end

end