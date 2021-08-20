class Role < DataClass

    attr_accessor :game, :alignment, :occupation

    def initialize(game, alignment_name = 'Town', occupation_name = nil)
        game.roles << self
        alignment_name ||= 'Town'
        self.game = game
        self.alignment = Alignment.find_by(name: alignment_name)
        self.occupation = occupation_name && Occupation.find_by(name: occupation_name)
    end

    def to_s
        if self.occupation
            self.occupation.role_string || "#{self.alignment} #{self.occupation}"
        else
            self.alignment.vanilla
        end
    end

    def scum?
        self.alignment.scum?
    end

end