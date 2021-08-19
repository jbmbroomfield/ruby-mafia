class User < DataClass

    attr_accessor :username

    def initialize(username)
        self.username = username
    end

    def to_s
        self.username
    end
    
end

User.new_many(
    'Alice',
    'Bob',
    'Chris',
    'Derrick',
    'Esther',
    'Frank',
    'Gary',
    'Henry',
    'Isaac',
    'Juliet',
)