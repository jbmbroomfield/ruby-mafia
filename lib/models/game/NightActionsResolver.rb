class NightActionsResolver

    @@resolution_order = [
        'pre',
        # 'copy',
        # 'hide',
        # 'bus drive',
        'block',
        # 'redirect',
        'protect',
        'misc',
        'kill',
        # 'recruit',
        'inspect',
        'post',
    ]

    attr_accessor :actions

    def initialize(actions)
        self.actions = actions
    end

    def resolve
        @@resolution_order.each do |resolution|
            resolve_by_resolution(resolution)
        end 
    end
    
    def resolve_by_resolution(resolution)
        actions.each do |action|
            action.resolve if action.resolution == resolution
        end
    end

    # def resolve_investigations
    #     investigations = actions.filter do |action|
    #         action.target && action.type.is_a?(Occupation) && action.type.investigative?
    #     end
    #     investigations.each do |investigation|
    #         occupation = investigation.type
    #         investigation.result = occupation.get_result(investigation.target)
    #         target_occupation = investigation.target.role.occupation
    #         investigation = target_occupation.target_modify_action(investigation) if target_occupation
    #     end
    # end

    # def resolve_protections
    #     protectors = actions.filter do |action|
    #         action.target && action.protection && action.successful
    #     end
    #     protectors.each do |protector|
    #         if protector.protection == 'single kill'
    #             kill = actions.find { |action| action.target == protector.target && action.type == 'kill'}
    #             kill.successful = false if kill
    #         end
    #     end
    # end

    # def resolve_kills
    #     kills = actions.filter do |action|
    #         action.target && action.type == 'kill'
    #     end
    #     kills.each do |kill|
    #         resolve_kill(kill)
    #     end
    # end

    # def resolve_kill(kill)
    #     kill.result = "#{kill.player} attacked #{kill.target}"
    #     if kill.successful
    #         kill.target.status.eliminate('Killed', kill.night)
    #     end
    # end

end