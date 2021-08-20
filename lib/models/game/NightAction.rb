class NightAction < DataClass

    attr_accessor :night, :resolver, :player, :target, :successful, :result

    def initialize(night, resolver, player = nil)
        night.actions << self
        @night = night
        @resolver = resolver.is_a?(String) ? Resolver.find_by(name: resolver) : resolver
        @player = player
        @successful = true
    end

    def resolve
        resolver.resolve(self)
    end

    def resolution
        return if resolver.type == 'target' && !target
        resolver.resolution
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