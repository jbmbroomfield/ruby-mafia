class NightAction < DataClass

    attr_accessor :night, :player, :target, :type, :successful, :result

    def initialize(night, type, player = nil)
        night.actions << self
        self.night = night
        self.player = player
        self.type = type
        self.successful = true
    end

    def block
        self.successful = false
    end

    def to_s
        "#{night}: #{type} - #{player} => #{target}"
    end

    def occupation?
        type.is_a?(Occupation)
    end

    def name
        occupation? ? type.name : type
    end

    def investigative?
        occupation? && type.investigative?
    end

    def protection
        occupation? && type.protection
    end

end