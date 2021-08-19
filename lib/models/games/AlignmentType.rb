class AlignmentType < DataClass

    attr_accessor :name

    def initialize(name)
        self.name = name
    end

    def self.find_by_name(name)
        self.all.find { |alignment_type| alignment_type.name == name }
    end
    
end

AlignmentType.new_many(
    'Town',
    'Mafia',
)
