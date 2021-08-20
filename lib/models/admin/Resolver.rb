class Resolver < DataClass

    attr_accessor :name, :type, :resolution

    def initialize(name, type, resolution)
        @name = name
        @type = type
        @resolution = resolution
    end

    def resolve
    end

end