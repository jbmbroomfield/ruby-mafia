class Occupation < DataClass

    attr_accessor :name, :night_action, :role_string, :investigative, :protection

    def initialize(name, night_action = nil)
        self.name = name
        self.night_action = night_action
    end

    def to_s
        self.name
    end

    def investigative?
        investigative
    end

    def get_result
        ''
    end

    def target_modify_action(action)
        action
    end
    
end

ic = Occupation.new('Innocent Child')
ic.role_string = 'Innocent Child'

cop = Occupation.new('Cop', 'target')
cop.investigative = true

def cop.get_result(target)
    target.role.alignment.name
end

godfather = Occupation.new('Godfather')

def godfather.target_modify_action(action)
    action.result = 'Town' if action.name == 'Cop'
    action
end


doctor = Occupation.new('Doctor', 'target')
doctor.protection = 'single kill'

