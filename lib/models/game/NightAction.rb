class NightAction < DataClass

    attr_accessor :night, :resolver, :player, :target, :successful, :result

    def initialize(night, resolver, player = nil)
        night.actions << self
        @night = night
        @resolver = resolver.is_a?(String) ? Resolver.find_by(name: resolver) : resolver
        @player = player
        @successful = true
    end

    def name
        resolver.name
    end

    def resolve
        resolver.resolve(self) if self.successful
    end

    def resolution
        return if resolver.type == 'target' && !target
        resolver.resolution
    end

    def make_innocent
        resolver.make_innocent(self) rescue nil
    end

    def block
        self.successful = false
    end

    def to_s
        "#{night}: #{resolver.type} - #{player} => #{target}"
    end

end