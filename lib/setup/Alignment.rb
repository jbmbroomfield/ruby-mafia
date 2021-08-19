class Alignment < DataClass

    attr_accessor :name, :alignment_type, :vanilla, :vanillas

    def initialize(name, alignment_type = nil)
        self.name = name
        self.alignment_type = AlignmentType.find_by_name(alignment_type || name)
    end

    def to_s
        self.name
    end

end