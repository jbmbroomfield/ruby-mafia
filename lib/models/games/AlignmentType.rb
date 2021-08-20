class AlignmentType < DataClass

    attr_accessor :name, :scum

    def initialize(name, scum)
        self.name = name
        self.scum = scum
    end

    def self.find_by_name(name)
        self.all.find { |alignment_type| alignment_type.name == name }
    end

    def victory?(team)
        return false if !team.active?
        return false if !!team.game.teams.find { |team2| team2 != team && team2.active? && team2.scum? }
        phase = team.game.phase
        phase.is_a?(Day) ? self.day_victory?(team) : self.night_victory?(team)
    end

    def day_victory?(team)
        if self.scum
            team.active_players.count >= (team.game.active_players.count - 1) / 2.0
        else
            true
        end
    end

    def night_victory?(team)
        if self.scum
            team.active_players.count >= team.game.active_players.count / 2.0
        else
            true
        end
    end
    
end

AlignmentType.new('Town', false)
AlignmentType.new('Mafia', true)
AlignmentType.new('Serial Killer', true)